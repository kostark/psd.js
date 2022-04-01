const PSD = require('../../');
const path = require('path')

let file = process.argv[2] || '../images/example.psd';
let psdPath = path.join(__dirname, file)

let psd = PSD.fromFile(psdPath)
psd.parse()

console.log(psd.tree().export())
console.log('===============')
