fullphat-cobalt-128-icon
========================
This is a fork of the fullphat-cobalt theme for Snarl with support for 128px icons.

There are a few things I've changed, mostly because I use Snarl almost exclusively for music (via FooSnarl), and also because I thought the original themes were designed for rather small monitors. The differences are as follows:

- __128 ^ 2 px icons__ : Large icons for album art are useful. In Foobar I'd imagine I have the album art view portal set to something like 300px square; and while that seems overly large, the default size in the cobalt theme is something like 32 px per side, which is almost literally useless.

- __Font changed from Ariel to Segoe UI Light__ : This helps the theme feel more native to the Windows UI. I believe this looks good in Windows 8 as well.

- __Font increased from 9px to 16px__ : I have a large enough monitor that this isn't a problem, and the increased icon size gives me more vertical space to work with.

- __Popup width increased from 350px to 550px__ : I have a widescreen monitor, horizontal width is not a precious commodity.


### TODO: ###

Right now this is just a reminder for me to figure out something that is not entirely within this project:

- __Cover images from foobar via foosnarl are very static__. viz., foosnarl provides an image formatting string that I currently have set to "CURRENT_FOLDER/cover.jpg", and this does not cover the images that could be valid in the foobar cover image display (e.g, cover.png, cover.jpeg, images embedded in the mp3, ect.)
