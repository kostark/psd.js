LayerInfo = require '../layer_info.coffee'
Descriptor = require '../descriptor.coffee'

module.exports = class PlacedLayer extends LayerInfo
  @shouldParse: (key) -> key is 'PlLd'

  constructor: (layer, length) ->
    super(layer, length)
    @uuid = null
    @page = 0
    @totalPages = 0
    @antiAlias = 0
    @layerType = 0
    @transform = []
    @warp = null

  parse: ->
    @file.seek 8, true
    @uuid = @file.readString(@file.readByte())
    @page = @file.readInt()
    @totalPages = @file.readInt()
    @antiAlias = @file.readInt()
    @layerType = @file.readInt()

    @transform.push @file.readDouble() for i in [0...8]
    @file.seek 8, true
    @warp = new Descriptor(@file).parse()
    @parseWarp @warp

  parseWarp: (warp) ->
    envelopeWarp = warp.customEnvelopeWarp;
    meshPoints = null
    if envelopeWarp
      meshPoints = []

      xs = (envelopeWarp.meshPoints.find (i) => i.type is 'Hrzn')?.values || []
      ys = (envelopeWarp.meshPoints.find (i) => i.type is 'Vrtc')?.values || []

      for i in [0...xs.length]
        meshPoints.push({x: xs[i], y: ys[i]});

      warp.meshPoints = meshPoints


