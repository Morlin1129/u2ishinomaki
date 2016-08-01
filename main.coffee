class @Game
  YOUTUBE_ID = 'HNYkOJ-T63k'
  _game = null
  _yt = null
  _judge = null
  # _timing = [6.14,7.486,8.155,9.977,10.377,11.611,12.062,12.765,13.583,13.945,14.223,14.707,15.059,16.241,16.577,17.425,20.186,20.917,21.593,22.313,22.449,23.123,24.297,24.965,25.113,25.464,26.148,26.635,27.294,28.103,30.910,31.601,32.305,33.024,34.054,34.786,35.360,36.140,37.028,38.402,38.829,39.129,40.354,41.051,41.553,42.233,43.043,43.729,44.261,45.705,46.448,47.416,48.407,50.158,51.310,52.363,53.031,54.417,55.288,55.640,56.472,57.190,58.110,59.095,59.648,60.776, 61.993, 62.370, 63.072, 63.808, 64.493, 65.111, 65.688, 66.414, 67.192, 68.891, 69.209, 69.918, 70.056, 71.111, 71.744, 72.428, 72.861, 73.263, 73.755, 74.099, 74.639, 75.090, 75.426, 75.941, 76.472, 76.992]
  _timing_crap = [8.25,16.25,20.25,24.25,32.25,40.25,48.25,50.25,52.25,54.25,56.25,58.25,60.25,62.25,24.25,68.5,75.5 ]
  _timing_snap = [8,16,20,24,28,32,36,40,44,46,48,50,52,54,56,58,60,62,64,68,72]
  _timing_change = [24,48]
  # _timingIndex = 0
  _timing_crap_index = 0
  _timing_snap_index = 0
  _timing_change_index = 0
  _status = "stop"
  _endTime = 80
  _music = null
  _tempo = 57.5
  _opr = 8  #one phrase resolution
  _score = 1000
  _game_bg = null
  _score_txt = null
  _score_gage = null
  _delay = 1.34
  _shadow = null
  _crap = null
  _go_scr = null
  _result = null
  _clear = null
  _hover = null
  _window_height = $(window).height()
  _slider_h = 350
  _score_meter = null
  _getTiming = (timing)->
    return (timing / _tempo * 60 ) + _delay

  _craping = ->
    _game.assets['ahh.wav'].clone().play()
    _crap.scaleX = 1.1
    _crap.scaleY = 1.1
    setTimeout ->
      _crap.scaleX =  1
      _crap.scaleY =  1
    , 100
   
   




  constructor : (parms)->
    enchant()
    _game = new Core(640, 1080)
    _game.fps = 30
    _game.preload("icon.png",
     "shadow.png", "jayz.mp3","whisper.wav"
     "game_bg1.jpg","game_bg2.jpg","game_bg3.jpg","snap.wav",
     "crap.png","ahh.wav",
     "splash.jpg","go_scr.jpg",
     "cutIn.jpg","start_button.png",
     "butterfly.png","slider_1.png","slider_2.png","meter.png","hover.png","score_volume.png"
     "clear.jpg","result.jpg")
    
    _game.start()
    
    _game.onload = ->
      
      

      # _game.rootScene.addEventListener "touchstart", (e)->
      #   _game.rootScene.addEventListener "enterframe", _proccesRootSceneFrame
      #   if _status != 'playing' 
      #     _status = 'playing'
      #     _music = _game.assets['jayz.mp3']
      #     _music.play()


      _game_bg = new Sprite(640,1080)
      

      _game_bg.image = _game.assets["game_bg1.jpg"]
      _game_bg.x = 0
      _game_bg.y = 0
      _game.rootScene.addChild(_game_bg)

      


      _score_txt = new Label(200,40) ;
      _score_txt.font = "36px libelsuit"
      _score_txt.x = 420
      _score_txt.textAlign = 'right'
      _score_txt.y = 100
      _score_txt.text = _score
      _game.rootScene.addChild(_score_txt)
      _score_gage = new Sprite(579,30)
      _score_gage.image = _game.assets["meter.png"]
      _score_gage.x = 30
      _score_gage.y = 60
      _game.rootScene.addChild(_score_gage)
      _score_meter = new Sprite(100,30)
      _score_meter.image = _game.assets["score_volume.png"]
      _score_meter.x = 140
      _score_meter.y = 60
      _game.rootScene.addChild(_score_meter)

      

      slider_1 = new Sprite(455,104)
      slider_1.image = _game.assets["slider_1.png"]
      slider_1.x = 640 - 455 - 20
      slider_1.y = _window_height - 420
      slider_1.addEventListener "touchstart", (e) ->
        if !_hover
          _hover = new Sprite(104,104)
          _hover.image = _game.assets["hover.png"]
          _hover.x = e.x - 52
          _hover.y = _window_height - 340 - 86
          _game.rootScene.addChild(_hover)
      slider_1.addEventListener "touchmove", (e) ->
        if _hover
          _hover.x = e.x - 52
      slider_1.addEventListener "touchend", (e) ->
        _hover.tl.removeFromScene()
        _hover = null
      _game.rootScene.addChild(slider_1)
      # slider_2 = new Sprite(290,80)
      # slider_2.image = _game.assets["slider_2.png"]
      # slider_2.x = 640 - 290 - 20
      # slider_2.y = _window_height - 330
      # _game.rootScene.addChild(slider_2)

      _shadow = new Sprite(104, 104)
      _shadow.image = _game.assets["shadow.png"]
      _shadow.x = 164
      _shadow.y = _window_height - 340 - 86
      _shadow.addEventListener "touchstart", (e) -> 
        _game.assets['snap.wav'].clone().play()
        _shadow.scaleX = 1.2
        _shadow.scaleY = 1.2
        setTimeout ->
          _shadow.scaleX =  1
          _shadow.scaleY =  1
        , 100

      _game.rootScene.addChild(_shadow)


      _crap = new Sprite(160, 160)
      _crap.image = _game.assets["crap.png"]
      _crap.x = 20
      _crap.y = _window_height - 250
      _crap.addEventListener "touchstart", (e) -> 
        _craping()
      _game.rootScene.addChild(_crap)

      _judge = new Label()
      _judge.font = "80px libelsuit"
      _judge.textAlign = "center"
      _judge.color = "#00FFFC"
      _judge.width = 200
      _judge.x = 220
      _judge.y = ( _window_height / 2 ) - 20

      _game.rootScene.addChild(_judge)
      
      # start button
      start_button = new Sprite(341,84)
      start_button.image = _game.assets["start_button.png"]
      start_button.x = 149
      start_button.y = 440
      start_button.addEventListener "touchstart", (e)->
        _game.rootScene.addEventListener "enterframe", _proccesRootSceneFrame
        if _status != 'playing' 
          _status = 'playing'
          _music = _game.assets['jayz.mp3']
          _music.play()
          start_button.tl.fadeOut(15).removeFromScene()
      _game.rootScene.addChild(start_button)

      # GOボタンのあるスクリーン 
      _go_scr = new Sprite(640,1080) 
      _go_scr.image = _game.assets["go_scr.jpg"]
      _go_scr.addEventListener "touchstart", (e) -> 
        go_se = _game.assets['whisper.wav']
        go_se.play()
        setTimeout ->
          _go_scr.tl.fadeOut(15).removeFromScene()
        ,1000
      _game.rootScene.addChild(_go_scr)
      splash = new Sprite(640,1080)
      splash.image = _game.assets["splash.jpg"]

      cutIn = new Sprite(640,1080)
      cutIn.image = _game.assets["cutIn.jpg"]
      _game.rootScene.insertBefore(cutIn, splash)
      
      _game.rootScene.addChild(splash)
      setTimeout ->
        splash.tl.fadeOut(30).removeFromScene().then( ->
          setTimeout ->
            cutIn.tl.fadeOut(15).removeFromScene()
          , 1000)
      , 3000


  # _isNoteGenerateTiming = ->
  #   if _timing[_timingIndex]?
  #     if _music.currentTime > _timing[_timingIndex] - 3
  #       return true
  #   return false
  _isNoteGenerateTimingSnap = ->
    if _timing_snap[_timing_snap_index]?
      if _music.currentTime > (_timing_snap[_timing_snap_index] * 58 / 60) - 3
        return true
    return false
  _isNoteGenerateTimingCrap = ->
    if _timing_crap[_timing_crap_index]?
      if _music.currentTime > (_timing_crap[_timing_crap_index] * 58 / 60) - 3
        return true
    return false

  _isChangeImage = ->
    if _timing_change[_timing_change_index]?
      if _music.currentTime > (_timing_change[_timing_change_index] * 58 / 60)
        _timing_change_index++
        _game_bg.tl.fadeOut(15).then ->
          _game_bg.image = _game.assets["game_bg" + ( _timing_change_index + 1 ) + ".jpg"]
          _game_bg.tl.fadeIn(15)
          

  _generateNoteCrap = (number)->
    note = new Sprite(160, 160)
    note.image = _game.assets["crap.png"]
    note.opacity = 0.5
    note.number = number
    note.x = 20
    note.y = 200 #880
    note.timing = _timing_snap[number]
    _game.rootScene.addChild(note)
    note.tl.setTimeBased()
    # note.tl.moveX(280, ((_timing[number] - _music.currentTime ) * 1000))
    note.tl.moveY(_window_height - 250, ((_getTiming(_timing_crap[number]) - _music.currentTime ) * 1000))
    note.addEventListener "touchstart", (e)->
      _craping()
      @clearTime = _music.currentTime
      @clear = true
      _game.assets['snap.wav'].clone().play()
      
    note.addEventListener "enterframe", ->
      if _music.currentTime > _getTiming(_timing_crap[number]) + 1
        _score -= 100
        _score_txt.text = _score
        _game.rootScene.removeChild(@)
        
      if @clear
        @opacity -= 0.2
        @scale(@scaleX + 0.05, @scaleY + 0.05)
        if @opacity <= 0
          _game.rootScene.removeChild(@)
          if @clearTime && -0.2 <= @clearTime - _getTiming(_timing_crap[number]) <= 0.2
            _judge.text = "COOL"
            _score += 100
            _score_txt.text = _score
            _fly()
            _score_meter.width += 10

          else if @clearTime && -0.4 <= @clearTime - _getTiming(_timing_crap[number]) <= 0.4 
            _judge.text = "GOOD"
            _score += 50
            _score_txt.text = _score
            _score_meter.width += 5
          else 
            _judge.text = "BAD"
            #_score -= 200
            _score_txt.text = _score
  _fly = ->
    butterfly = new Sprite(640,377)
    butterfly.image = _game.assets["butterfly.png"]
    butterfly.x = 0
    butterfly.y = 100
    butterfly.scale(0.5,0.5)
    butterfly.opacity = 0
    _game.rootScene.addChild(butterfly)
    butterfly.tl.fadeIn(5).then( -> (butterfly.scale(1.5,1.5))).fadeOut(5).removeFromScene()

  _generateNote = (number)->
    note = new Sprite(90, 90)
    note.image = _game.assets["icon.png"]
    note.number = number
    note.x = 183
    note.y = -90 #880
    note.timing = _timing_snap[number]
    _game.rootScene.addChild(note)
    note.tl.setTimeBased()
    # note.tl.moveX(280, ((_timing[number] - _music.currentTime ) * 1000))
    note.tl.moveY(_window_height - 340 - 85, ((_getTiming(_timing_snap[number]) - _music.currentTime ) * 1000))
    note.addEventListener "touchstart", (e)->
    note.addEventListener "touchend", (e)->
      # _shadow.scaleX = 1.2
      # _shadow.scaleY = 1.2
      # setTimeout ->
      #   _shadow.scaleX =  1
      #   _shadow.scaleY =  1
      # , 100
      # @clearTime = _music.currentTime
      # @clear = true
      # _game.assets['snap.wav'].clone().play()
      
    note.addEventListener "enterframe", ->
      # 接触判定
      if @intersect(_hover) 
        _hover.tl.removeFromScene()
        _hover = null
        @clearTime = _music.currentTime
        _game.assets['snap.wav'].clone().play()
        @clear = true
      if _music.currentTime > _getTiming(_timing_snap[number]) + 1
        _score -= 100
        _score_txt.text = _score
        _game.rootScene.removeChild(@)
        
      if @clear
        @opacity -= 0.2
        @scale(@scaleX + 0.05, @scaleY + 0.05)
        if @opacity <= 0
          _game.rootScene.removeChild(@)

          if @clearTime && -0.2 <= @clearTime - _getTiming(_timing_snap[number]) <= 0.2
            _judge.text = "COOL"
            _score += 100
            _score_txt.text = _score
            _fly()
            _score_meter.width += 10
          else if @clearTime && -0.4 <= @clearTime - _getTiming(_timing_snap[number]) <= 0.4 
            _judge.text = "GOOD"
            _score += 50
            _score_txt.text = _score
            _score_meter.width += 5
          else 
            _judge.text = "BAD"
            _score -= 0
            _score_txt.text = _score

  _proccesRootSceneFrame = ->
    if _status is "playing"
      # if _isNoteGenerateTiming()
      #   _generateNote(_timingIndex)
      #   _timingIndex++
      if _isNoteGenerateTimingSnap()
        _generateNote(_timing_snap_index)
        _timing_snap_index++
      if _isNoteGenerateTimingCrap()
        _generateNoteCrap(_timing_crap_index)
        _timing_crap_index++
      _isChangeImage()

      if _music.currentTime >= _endTime
        # _yt.setVolume(_youtube.getVolume() - 1)
        # if _yt.getVolume() <= 0
        _music.stop()
        _status = "end"
        _end()

      if _score <= 0 
          _music.stop()
          _status = "end"
          _judge.text = "GAME OVER"

  _end = ->
        # GOボタンのあるスクリーン 
    _result = new Sprite(640,1080) 
    _result.image = _game.assets["result.jpg"]
    _result.addEventListener "touchstart", (e) -> 
    _game.rootScene.addChild(_result)
    _clear = new Sprite(640,1080) 
    _clear.image = _game.assets["clear.jpg"]
    _clear.addEventListener "touchstart", (e) -> 
      _clear.tl.removeFromScene()
    _game.rootScene.addChild(_clear)
    final_score = new Label()
    final_score.font = "80px libelsuit"
    final_score.textAlign = "center"
    final_score.color = "#fff"
    final_score.width = 640
    final_score.x = 0
    final_score.y = 200
    final_score.text = "Final Score : " + _score
    _game.rootScene.addChild(final_score)


class @Yt
  _player = null
  _isReady = false
  _state = null
  constructor : (parms)->
    tag = document.createElement('script')
    tag.src = 'https://www.youtube.com/iframe_api'
    firstScriptTag = document.getElementsByTagName('script')[0]
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)
  play : -> _player.playVideo()
  getCurrentTime : -> _player.getCurrentTime()
  setVolume : (volume)-> _player.setVolume(volume)
  getVolume : -> _player.getVolume()
  isReady : -> _isReady
  onPlayerReady = -> _isReady = true
  window.onYouTubeIframeAPIReady = ->
    _player = new YT.Player 'player',
      events:
        'onReady': onPlayerReady


new Game()

$ ->
  $(window).on 'load', ->
    setTimeout(scrollTo( 0, 1), 0)
