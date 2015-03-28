fs = require('fs')

{_, $, Backbone, Marionette } = require( './common.coffee' )
{ AppView, LoadingView } = require( './views/index.coffee' )
{ IntroView } = require './views/IntroView.coffee'
{ ContentsView } = require './views/ContentsView.coffee'
{ MagnetCollection, Magnet } = require( './models/models.coffee' )
{ nw, win } = window.nwin

gm = require( './lib/gossip.js')
WebTorrent = require 'webtorrent'
client = new WebTorrent()

magnetCollection = new MagnetCollection( [], torrentClient: client, gm: gm )

# Use The Map, to find bootstrap/seed peers.
console.log "__dirname: #{ __dirname } "
client.seed "#{ __dirname }/../images/map.svg", { name: 'Piratechest Seed Map', comment: 'This map is designed to be seeded as a torrent by the piratechest application in order to bootstrap peer discovery.' }, (torrent) ->
    console.log "Seeding the map. Stored at: window.seedMap"
    window.seedMap = torrent


$ ->
    appRegion = new Marionette.Region( el: $('body').get(0) )
    appRegion.show( new LoadingView() )
    # TODO: Actually load stuff not just setTimeout
    appView = new AppView( collection: magnetCollection )
    setTimeout ( ->
        appRegion.show( appView )
        introView = new IntroView()
        appView.showOverlay( introView )
        introView.on 'close', ->
            appView.showOverlay( new ContentsView() )
            
    ), 1000
    win.show()
    setTimeout ( -> 
        magnetCollection.add new Magnet
            infoHash: '546cf15f724d19c4319cc17b179d7e035f89c1f4'
            favorite: false
    ), 10000

