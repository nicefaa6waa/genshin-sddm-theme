#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 FragColor; // output with name gl_ is reserved

// varying highp vec2 qt_TexCoord0;
layout(binding = 0) uniform sampler2D source;

void main(void)
{
    vec4 color = texture(source, qt_TexCoord0);
    
    // Adjust threshold to prevent artifacts
    float threshold = 0.15;
    
    if (color.r < threshold && color.g < threshold && color.b < threshold) {
        color.a = 0.0;
    }

    FragColor = color;
}