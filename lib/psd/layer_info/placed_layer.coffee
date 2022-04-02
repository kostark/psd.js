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

  parse: ->
# skip type and version
    @file.seek 8, true
    ulen = @file.readByte()
#    @uuid = @file.readUnicodeString(ulen)
    @file.seek ulen, true
    @page = @file.readInt()
    @totalPages = @file.readInt()
    @antiAlias = @file.readInt()
    @layerType = @file.readInt()

    @transform.push @file.readDouble() for i in [0...8]
    @file.seek 8, true
    @data = new Descriptor(@file).parse()

