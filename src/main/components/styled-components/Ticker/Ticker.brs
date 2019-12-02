' initialization method for the Ticker node. 
sub init()
    m.label = m.top.findNode("label")
    m.animation = m.top.findNode("animation")
    m.interpolator = m.top.findNode("interpolator")
    ' fix these so that they are set at the appropriate time
    m.animation.duration = m.top.scrollDuration
    m.text = m.top.text
    m.width = m.top.width
    'm.height = m.top.height
    'm.label.height = m.height
    dim startPos[1]
    startPos[0] = m.width
    startPos[1] = 0
    m.interpolator.keyValue[0] = startPos
    dim endPos[1]
    endPos[0] = -m.width
    endPos[1] = 0
    dim values[1]
    values[0] = startPos
    values[1] = endPos
    m.interpolator.keyValue = values
    m.top.observeField("text", "setText")
    m.label.observeField("renderTracking", "restartAnimation")
    'm.label.observeField("visible", "restartAnimation")
    m.animation.observeField("state", "continueAnimation")
end sub

sub restartAnimation(event as object)
    if event.getData() = "none" then
        dim startPos[1]
        startPos[0] = m.width
        startPos[1] = 0
        dim endPos[1]
        endPos[0] =  m.label.translation[0]
        endPos[1] = 0
        dim values[1]
        values[0] = startPos
        values[1] = endPos
        m.interpolator.keyValue = values
        originalDuration = m.animation.duration
        originalDistance = 2*m.width
        newDistance = m.width - m.label.translation[0]
        newDuration = originalDuration * newDistance / originalDistance
        m.animation.duration = newDuration
        m.animation.unobserveField("state")
        m.label.unobserveField("renderTracking")
        m.animation.repeat = true
        m.animation.control = "start"
    end if
end sub

sub continueAnimation(event as object)
    if event.getData() = "stopped" then
        print m.label.translation[0]
        dim startPos[1]
        startPos[0] = m.label.translation[0]
        startPos[1] = 0
        dim endPos[1]
        endPos[0] =  m.label.translation[0] - m.width*2
        endPos[1] = 0
        dim values[1]
        values[0] = startPos
        values[1] = endPos
        m.interpolator.keyValue = values
        m.animation.control = "start"
    end if
end sub

' method to append text to the currently scrolling labels
'
' @param additionalText the string to append to the currently scrolling text
sub addText(additionalText as string)

end sub

' method to replace currently scrolling text. 
' 
' @param replacementText the string to replace the text with
' @param isInterruption an optional boolean value representing whether to interrupt the currently scrolling string. Defaults to false.
sub replaceText(additionalText as string, isInterruption = false as boolean)

end sub

' method to set the text initially and start the animations
sub setText()
   ' m.top.unobserveField("text")
   ' m.text = m.top.text
    m.label.text = m.top.text
    m.animation.control = "start"
end sub
