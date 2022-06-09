using System;
using System.Threading;
using System.IO;
using System.Text.RegularExpressions;
using System.Linq;
using netDumbster.smtp;

namespace Main
{
    class Program
    {
        static Regex whiteRegex;
        static Regex badWordsRegex;

        static void Main(string[] args)
        {
            var exitEvent = new ManualResetEvent(false);
            Console.CancelKeyPress += (sender, eventArgs) => {
                                        eventArgs.Cancel = true;
                                        exitEvent.Set();
                                    };
            
            var smtpServerPort = 3325;
            var storeLocation = "data";
            var statsFilename = "data/stats.txt";
            whiteRegex = new Regex("@(cpnv.ch|vd.ch)$");
            badWordsRegex = new Regex(String.Join("|", File.ReadLines("bad_words_list.txt")));

            var receivedCount = 0;
            var rejectedCount = 0;

            var smtpServer = SimpleSmtpServer.Start(smtpServerPort);
            smtpServer.MessageReceived += (sender, args) =>
            {
                var mail = args.Message;

                Console.WriteLine($"Received mail: {mail.FromAddress} {mail.ToAddresses[0]}");
                receivedCount++;

                if (HasBadWords(mail) || HasInvalidRecipient(mail))
                {
                    Console.WriteLine($"Rejected mail: {mail.FromAddress} {mail.ToAddresses[0]}");
                    rejectedCount++;
                }
                else
                {
                    Console.WriteLine($"Stored mail  : {mail.FromAddress} {mail.ToAddresses[0]}");

                    foreach (var address in mail.ToAddresses)
                    {
                        var file = new FileInfo(Path.Combine(storeLocation, address.Address, $"{DateTime.Now.Ticks}.eml"));
                        file.Directory.Create();
                        File.WriteAllText(file.FullName, mail.Data);
                    }
                }

                using (StreamWriter file = new StreamWriter(statsFilename))
                {
                    file.WriteLine($"Received count: {receivedCount}");
                    file.WriteLine($"Rejected count: {rejectedCount}");
                    file.WriteLine($"Spam ratio: {rejectedCount * 100 / receivedCount}%");
                }
            };

            exitEvent.WaitOne();
            smtpServer.Stop();
        }

        static bool HasBadWords(SmtpMessage mail)
        {
            return mail.MessageParts.Any(part => badWordsRegex.IsMatch(part.BodyData));
        }

        static bool HasInvalidRecipient(SmtpMessage mail)
        {
            return !mail.ToAddresses.Any(address => whiteRegex.IsMatch(address.Address));
        }
    }
}
