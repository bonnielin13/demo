var curIndex=0;
                            var img_number = document.getElementsByClassName('tabImg').length;
                            var _timer = setInterval(runFn,2000);
                            function runFn(){      
                                curIndex = ++curIndex == img_number ? 0 : curIndex;
                                slideTo(curIndex);
                             }
                             
                        
                             window.onload = function  () {  
                                var tbs = document.getElementsByClassName("tabBtn");
                                for(var i=0;i<tbs.length;i++){
                                    tbs[i].onclick = function  () {
                                        clearInterval(_timer);
                                        slideTo(this.attributes['num'].value);
                                        curIndex = this.attributes['num'].value
                                        _timer = setInterval(runFn,2000);
                                    }
                                }
                            }
                        
                            var prve = document.getElementsByClassName("prve");
                            prve[0].onclick = function () {
                                clearInterval(_timer);
                                curIndex--;
                                if(curIndex == -1){
                                    curIndex = img_number-1;
                                }
                                slideTo(curIndex);
                                _timer = setInterval(runFn,2000);
                            }
                            
                            var next = document.getElementsByClassName("next");
                            next[0].onclick = function () {
                                clearInterval(_timer);
                                curIndex++;
                                if(curIndex == img_number){
                                    curIndex =0;
                                }
                                slideTo(curIndex);
                                _timer = setInterval(runFn,2000);
                            }
                            
                            function slideTo(index){
                                console.log(index)
                                var index = parseInt(index);
                                var images = document.getElementsByClassName('tabImg');
                                for(var i=0;i<images.length;i++){
                                    if( i == index ){
                                        images[i].style.display = 'inline';     
                                    }else{
                                        images[i].style.display = 'none';
                                    }
                                }
                                var tabBtn = document.getElementsByClassName('tabBtn');
                                for(var j=0;j<tabBtn.length;j++){
                                    if( j == index ){
                                        tabBtn[j].classList.add("hover");    
                                        curIndex=j;
                                    }else{
                                        tabBtn[j].classList.remove("hover");
                                    }
                                }
                                
                            }