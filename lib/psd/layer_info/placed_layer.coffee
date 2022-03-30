LayerInfo = require '../layer_info.coffee'
Descriptor = require '../descriptor.coffee'

module.exports = class PlacedLayer extends LayerInfo
  @shouldParse: (key) -> key is 'PlLd'

  parse: ->
# skip type and version
    @file.seek 8, true
    @uuid = @file.readUnicodeString()
    @page = @file.readInt()
    @totalPages = @file.readInt()
    @antiAlias = @file.readInt()
    @layerType = @file.readInt()

    @transform = []
    @transform.push @file.readDouble() for i in [0...8]
    @file.seek 8, true
    @data = new Descriptor(@file).parse()

