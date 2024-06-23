#pragma header

uniform float range;
		uniform float iTime;
		uniform sampler2D noiseTexture;
		uniform float noisePercent;
		uniform vec3 iResolution;
		uniform float offsetIntensity;
		
		float rand(vec2 co)
		{
			float a = 12.9898;
			float b = 78.233;
			float c = 43758.5453;
			float dt= dot(co.xy ,vec2(a,b));
			float sn= mod(dt,3.14);
			return fract(sin(sn) * c);
		}

		vec3 mod289(vec3 x) {
			return x - floor(x * (1.0 / 289.0)) * 289.0;
		}

		vec2 mod289(vec2 x) {
			return x - floor(x * (1.0 / 289.0)) * 289.0;
		}

		vec3 permute(vec3 x) {
			return mod289(((x*34.0)+1.0)*x);
		}

		float snoise(vec2 v)
		{
			 const vec4 C = vec4(0.211324865405187,  // (3.0-sqrt(3.0))/6.0
                      0.366025403784439,  // 0.5*(sqrt(3.0)-1.0)
                     -0.577350269189626,  // -1.0 + 2.0 * C.x
                      0.024390243902439); // 1.0 / 41.0
			// First corner
			vec2 i  = floor(v + dot(v, C.yy) );
			vec2 x0 = v -   i + dot(i, C.xx);

			// Other corners
			vec2 i1;
			//i1.x = step( x0.y, x0.x ); // x0.x > x0.y ? 1.0 : 0.0
			//i1.y = 1.0 - i1.x;
			i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
			// x0 = x0 - 0.0 + 0.0 * C.xx ;
			// x1 = x0 - i1 + 1.0 * C.xx ;
			// x2 = x0 - 1.0 + 2.0 * C.xx ;
			vec4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;

			// Permutations
			i = mod289(i); // Avoid truncation effects in permutation
			vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
					+ i.x + vec3(0.0, i1.x, 1.0 ));

			vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
			m = m*m ;
			m = m*m ;

			// Gradients: 41 points uniformly over a line, mapped onto a diamond.
			// The ring size 17*17 = 289 is close to a multiple of 41 (41*7 = 287)

			vec3 x = 2.0 * fract(p * C.www) - 1.0;
			vec3 h = abs(x) - 0.5;
			vec3 ox = floor(x + 0.5);
			vec3 a0 = x - ox;

			// Normalise gradients implicitly by scaling m
			// Approximation of: m *= inversesqrt( a0*a0 + h*h );
			m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );

			// Compute final noise value at P
			vec3 g;
			g.x  = a0.x  * x0.x  + h.x  * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 90.0 * dot(m, g);
		}
			
		float noise(vec2 p)
		{
			return rand(p) * noisePercent;
		}
		
		float onOff(float a, float b, float c)
		{
			return step(c, sin(iTime + a*cos(iTime*b)));
		}

		float ramp(float y, float start, float end)
		{
			float inside = step(start,y) - step(end,y);
			float fact = (y-start)/(end-start)*inside;
			return (1.-fact) * inside;
		}

		float stripes(vec2 uv)
		{
			float noi = noise(uv*vec2(0.5,1.) + vec2(1.,3.));
			return ramp(mod(uv.y*4. + iTime/2.+sin(iTime + sin(iTime*0.63)),1.),0.5,0.6)*noi;
		}

		vec4 getVideo(vec2 uv)
		{

			float time = iTime * 2.0;
			
			// Create large, incidental noise waves
			float noise2 = max(0.0, snoise(vec2(time, uv.y * 0.3)) - 0.3) * (1.0 / 0.7);
			
			// Offset by smaller, constant noise waves
			noise2 = noise2 + (snoise(vec2(time*10.0, uv.y * 2.4)) - 0.5) * 0.15;
			
			// Apply the noise as x displacement for every line
			float xpos = uv.x - noise2 * noise2 * 0.25;

			vec2 look = vec2(xpos, uv.y);

			float window = 1./(2.+20.*(look.y-mod(iTime ,1.))*(look.y-mod(iTime ,1.)));
			float vShift = 0.2*onOff(2.,3.,.9) * (sin(iTime)*sin(iTime*200.) + (0.2 + 0.1*sin(iTime*200.)*cos(iTime/10)));
			look.y = mod(look.y + vShift, 1.);
			vec4 video = vec4(flixel_texture2D(bitmap,look));
			return video;
		}

		vec2 screenDistort(vec2 uv)
		{
			uv -= vec2(.5,.5);
			uv = uv*1.2*(1./1.2+2.*uv.x*uv.x*uv.y*uv.y);
			uv += vec2(.5,.5);
			return uv;
		}

		float verticalBar(float pos, float uvY, float offset)
		{
			float edge0 = (pos - range);
			float edge1 = (pos + range);

			float x = smoothstep(edge0, pos, uvY) * offset;
			x -= smoothstep(pos, edge1, uvY) * offset;
			return x;
		}

		void main()
                 {
			vec2 uv = openfl_TextureCoordv.xy;   

			for (float i = 0.0; i < 0.71; i += 0.1313)
			{
				float d = mod(iTime * i, 1.7);
				float o = sin(1.0 - tan(iTime * 0.24 * i));
				o *= offsetIntensity;
				uv.x += verticalBar(d, uv.y, o);
			}

			uv = screenDistort(uv);
			vec4 video = getVideo(uv);
			float x =  0.;

			video.r = getVideo(vec2(x+uv.x+(0.001/1),uv.y+(0.001/2)));
          	video.g = getVideo(vec2(x+uv.x+(0.000/1),uv.y-(0.002/2)));
          	video.b = getVideo(vec2(x+uv.x-(0.002/1),uv.y+(0.000/2)));
			
			float vigAmt = 3.+.3*sin(iTime + 5.*cos(iTime*5.));
			float vignette = (1.-vigAmt*(uv.y-.5)*(uv.y-.5))*(1.-vigAmt*(uv.x-.5)*(uv.x-.5));
			
			video += stripes(uv);
			video += noise(uv*2.)/2.;
			video *= vignette;
			video *= (12.+mod(uv.y*30.+iTime,1.))/13.;
			
			gl_FragColor = vec4(video);
		}