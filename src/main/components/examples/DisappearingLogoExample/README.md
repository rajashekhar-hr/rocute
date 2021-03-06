# DisappearingLogo

### Description
The 'DisappearingLogo' component is an image overlaid onto a Video component. It displays when the video is paused, and for a certain amount of time after the video starts or resumes playing. Then it fades to transparent over another amount of time. It can be placed in any of the four corners with a given offset, or at a custom translation relative to the translation of the video node. 
To utilize this tool,
 - The DisappearingLogo's videoId field should be the id of the video Component you wish to display the overlay on.
 - The LogoUri field should be the uri of the image to overlay.
 - The default position of the image is in the lower right corner of the video, with a 10px margin on the right and bottom. 

### Usage
| Field | Type | Default | Options | Required | AccessPermission | Description |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| logoUri | uri | | | true | READ_WRITE | The uri of the image. |
| logoSize | vector2d | | | false | READ_WRITE | The size of the image as a vector2D. |
| logoOpacity | float | 1 | a float between 0.0 and 1.0 | false | READ_WRITE | The maximum opacity of the image. |
| displayTime | float | 1 | | false | READ_WRITE | The time the image is displayed at maximum opacity, in seconds. |
| fadeTime | float | 1 | | false | READ_WRITE | The time the image is faded from maximum opacity to transparent, in seconds. |
| position | string | "bottomRight" | "topLeft", "topRight", "bottomLeft", "bottomRight" | false | READ_WRITE | Which corner of the video to display the image in. |
| margin | float | 10 | | false | READ_WRITE | If using position, the margin between the image and the edges of the video. |
| fixedPosition | boolean | false | | false | READ_WRITE | If true, the logoTranslation field is used instead of the position and margin fields. |
| logoTranslation | vector2d | [ ] | | false | READ_WRITE | An absolute translation of the image relative to the video. |
| videoId | string | "" | | false | READ_WRITE | The id of the video node. |