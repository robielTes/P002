
const Fs = require('fs')


function findAllFilePathsStartingWith(starts,path){
    let result = [];
    let files = Fs.readdirSync(path);
    for (let i = 0; i < files.length; i++) {
        let file = files[i];
        let filePath = path + '/' + file;
        if (Fs.statSync(filePath).isDirectory()) {
            result = result.concat(findAllFilePathsStartingWith(starts,filePath));
        } else if (file.startsWith(starts)) {
            result.push(filePath);
        }
    }
    return result;
}

console.log(findAllFilePathsStartingWith('read','.'))