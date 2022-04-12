
const Fs = require('fs')

function findAllFilePathsOfDepthStartingWith(fromDepth,toDepth,starts,path){
    let result = [];
    let files = Fs.readdirSync(path);
    for (let i = 0; i < files.length; i++) {
        let file = files[i];
        let filePath = path + '/' + file;
        if (Fs.statSync(filePath).isDirectory()) {
            result = result.concat(findAllFilePathsOfDepthStartingWith(fromDepth,toDepth,starts,filePath));
            } else if (file.startsWith(starts) ) {
            let deep = filePath.split('/').length - 2;
            if(deep >= fromDepth && deep <= toDepth ){
                result.push(filePath);
            }
    }
    }
    return result;
}

console.table(findAllFilePathsOfDepthStartingWith(1,2,'read','.'))