#version 450

uniform sampler2D tex;
in vec2 texCoord;
in vec4 color;
out vec4 frag;

void main() {
	float x = 1.0 / 800.0;
	float y = 1.0 / 600.0;
	vec4 texcolor0 = texture(tex, texCoord) * color;
	vec4 texcolor1 = texture(tex, texCoord + vec2(-x, -y)) * color;
	vec4 texcolor2 = texture(tex, texCoord + vec2(0, -y)) * color;
	vec4 texcolor3 = texture(tex, texCoord + vec2(x, -y)) * color;
	vec4 texcolor4 = texture(tex, texCoord + vec2(x, 0)) * color;
	vec4 texcolor5 = texture(tex, texCoord + vec2(x, y)) * color;
	vec4 texcolor6 = texture(tex, texCoord + vec2(0, y)) * color;
	vec4 texcolor7 = texture(tex, texCoord + vec2(-x, y)) * color;
	vec4 texcolor8 = texture(tex, texCoord + vec2(-x, 0)) * color;
	vec4 texcolor = texcolor0 + texcolor1 + texcolor2 + texcolor3 + texcolor4
		+ texcolor5 + texcolor6 + texcolor7 + texcolor8;
	texcolor /= 9.0;
	texcolor.rgb *= color.a;
	frag = texcolor;
}
