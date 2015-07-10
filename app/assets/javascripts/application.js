// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var tab_options = {
  $AutoPlay: true,                                   //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
  $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
  $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
  $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

  $ArrowKeyNavigation: true,                          //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
  $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
  $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
  $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
  $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
  $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
  $PlayOrientation: 2,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
  $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

  $ThumbnailNavigatorOptions: {
    $Class: $JssorThumbnailNavigator$,                //[Required] Class to create thumbnail navigator instance
    $ChanceToShow: 2,                                 //[Required] 0 Never, 1 Mouse Over, 2 Always
    $ActionMode: 1,                                   //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
    $AutoCenter: 3,                                   //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
    $Lanes: 1,                                        //[Optional] Specify lanes to arrange thumbnails, default value is 1
    $SpacingX: 0,                                     //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
    $SpacingY: 0,                                     //[Optional] Vertical space between each thumbnail in pixel, default value is 0
    $DisplayPieces: 5,                                //[Optional] Number of pieces to display, default value is 1
    $ParkingPosition: 0,                              //[Optional] The offset position to park thumbnail
    $Orientation: 2,                                  //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
    $DisableDrag: true                                //[Optional] Disable drag or not, default value is false
  }
};

var thumb_options = {
  $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
  $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
  $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

  $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
  $ArrowKeyNavigation: true,                          //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
  $SlideDuration: 800,                                //Specifies default duration (swipe) for slide in milliseconds

  $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
    $Class: $JssorArrowNavigator$,                    //[Requried] Class to create arrow navigator instance
    $ChanceToShow: 1                                  //[Required] 0 Never, 1 Mouse Over, 2 Always
  },

  $ThumbnailNavigatorOptions: {                       //[Optional] Options to specify and enable thumbnail navigator or not
    $Class: $JssorThumbnailNavigator$,                //[Required] Class to create thumbnail navigator instance
    $ChanceToShow: 2,                                 //[Required] 0 Never, 1 Mouse Over, 2 Always
    $ActionMode: 1,                                   //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
    $SpacingX: 8,                                     //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
    $DisplayPieces: 10,                               //[Optional] Number of pieces to display, default value is 1
    $ParkingPosition: 360                             //[Optional] The offset position to park thumbnail
  }
};
