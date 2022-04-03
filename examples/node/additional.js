const PSD = require('../../');
const path = require('path')

let file = process.argv[2] || '../images/test.psd';
let psdPath = path.join(__dirname, file)

let psd = PSD.fromFile(psdPath)
psd.parse()

console.log("layer count:", psd.layers.length)
for (let layer of psd.layers) {
    if (layer.placedLayer) {
        let tmp = layer.placedLayer()
        console.log(tmp.transform)
        console.log(tmp.warp?.meshPoints)
    }
}
console.log('===============')
