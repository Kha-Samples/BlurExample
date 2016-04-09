#version 100

#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D tex;
varying vec2 texCoord;
varying vec4 color;

void kore() {
	float x = 1.0 / 800.0;
	float y = 1.0 / 600.0;
	vec4 texcolor0 = texture2D(tex, texCoord) * color;
	vec4 texcolor1 = texture2D(tex, texCoord + vec2(-x, -y)) * color;
	vec4 texcolor2 = texture2D(tex, texCoord + vec2(0, -y)) * color;
	vec4 texcolor3 = texture2D(tex, texCoord + vec2(x, -y)) * color;
	vec4 texcolor4 = texture2D(tex, texCoord + vec2(x, 0)) * color;
	vec4 texcolor5 = texture2D(tex, texCoord + vec2(x, y)) * color;
	vec4 texcolor6 = texture2D(tex, texCoord + vec2(0, y)) * color;
	vec4 texcolor7 = texture2D(tex, texCoord + vec2(-x, y)) * color;
	vec4 texcolor8 = texture2D(tex, texCoord + vec2(-x, 0)) * color;
	vec4 texcolor = texcolor0 + texcolor1 + texcolor2 + texcolor3 + texcolor4
		+ texcolor5 + texcolor6 + texcolor7 + texcolor8;
	texcolor /= 9.0;
	texcolor.rgb *= color.a;
	gl_FragColor = texcolor;
}
