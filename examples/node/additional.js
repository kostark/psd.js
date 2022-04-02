const PSD = require('../../');
const path = require('path')

let file = process.argv[2] || '../images/test.psd';
let psdPath = path.join(__dirname, file)

let psd = PSD.fromFile(psdPath)
psd.parse()

let hat = psd.layers[11];
hat.placedLayer().parse()

console.log(hat)
console.log(psd.tree().export())
console.log('===============')
