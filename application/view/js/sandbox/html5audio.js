/**
 * @author andrewnite
 * Created: December 2nd 2015
 * Developed by: N-Gen Desing <http://ngendesign.net>
 * Author: Andrew Nite <info@ngendesign.net> || <ngendesign@email.com>
 * "Building to simply build"
 * 
 * HTML5 audio Ajax
 */
var html5Audio = {
    audioDir: 'files/media/',
    audioDiv: 'html5Audio',
    /*Append audio DOM to document*/
    audioInit: function(){
      if(!this.audioExists()){
          var audioTag = document.createElement('audio');
          audioTag.setAttribute('id',this.audioDiv);
          document.body.appendChild(audioTag);
      }
    },
    audioPlay: function(soundTrack,timeAction,callback) {
    	/**
    	 * Combine the operation of creating a source element
    	 * for the specific browser type
    	 */
        /*Create mp3 source DOM*/
        var mp3SourceTag = document.createElement('source');
        mp3SourceTag.setAttribute('id', 'mp3Audio');
        mp3SourceTag.setAttribute('type', 'audio/mp3');
        mp3SourceTag.setAttribute('src', this.audioDir+soundTrack+'.mp3');
        /*Create ogg source DOM*/
        var oggSourceTag = document.createElement('source');
        oggSourceTag.setAttribute('id', 'oggAudio');
        oggSourceTag.setAttribute('type', 'audio/ogg');
        oggSourceTag.setAttribute('src', this.audioDir+soundTrack+'.ogg');
        if(!this.audioExists()){
            this.audioInit();
        }
        /*Get audio DOM element*/
        var audioEle = document.getElementById(this.audioDiv);
        /*Is it already playing*/
    	if(audioEle.currentTime){
            audioEle.pause();
            document.body.removeChild(audioEle);
            if(typeof callback === 'function'){
                callback();
            }
            return;
        }
        /*Append mp3 and ogg to audio DOM element*/
        audioEle.appendChild(mp3SourceTag);
        audioEle.appendChild(oggSourceTag);
        audioEle.load();
        audioEle.play();
        
        /*callback audioEvent*/
       if(typeof timeAction !== 'undefined'){
        this.audioEvent(audioEle,timeAction);
       }
       
        audioEle.onended = function(){
            document.body.removeChild(audioEle);
            if(typeof callback === 'function'){
                callback();
            }
        };
    },
	audioEvent: function(audioEle,timeAction) {
		var setTime = false;
		audioEle.ontimeupdate = function() {
			//console.log('SetTime Top: '+setTime);
			var currentTime = parseInt(audioEle.currentTime, 10);
			if (timeAction.hasOwnProperty(currentTime)) {
				if (setTime != false && setTime != currentTime ) {
					if(typeof timeAction[currentTime] == 'function'){
						timeAction[currentTime]();
					}else{
						console.log('timeAction object key['+currentTime+'] value is not a function');
					}
					setTime = currentTime;
					//console.log('SetTime callback: '+setTime);
				}else{
					
				}
			} else {
				setTime = currentTime;
			}
		};
	},

    audioStop: function(){
       /*Get audio DOM element*/
        var audioEle = document.getElementById(this.audioDiv);
        audioEle.pause();
        document.body.removeChild(audioEle);
    },
    /*Check if audio DOM element exists*/
    audioExists: function() {
        return (typeof document.getElementsByTagName('audio')[0] !== 'undefined') ? true : false;
    }  
};
