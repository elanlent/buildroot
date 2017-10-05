// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     float _bloom_sigma_runtime;
COMPAT_VARYING     vec2 _bloom_dxdy;
COMPAT_VARYING     vec2 _tex_uv1;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _tex_uv1;
    vec2 _bloom_dxdy;
    float _bloom_sigma_runtime;
};
out_vertex _ret_0;
float _TMP23;
float _TMP25;
float _TMP22;
float _TMP21;
float _TMP20;
float _TMP19;
vec2 _TMP24;
float _TMP17;
float _TMP15;
float _TMP16;
input_dummy _IN1;
float _TMP142;
float _TMP148;
float _TMP154;
float _TMP160;
vec4 _r0239;
vec2 _TMP240;
float _desired_tile_size_x0241;
float _temp_tile_size_x0241;
vec2 _max_tile_size0241;
vec2 _estimated_mask_resize_output_dummy_size0241;
vec2 _reclamped_tile_size0241;
vec2 _final_resized_tile_size0241;
bool _TMP242;
float _b0244;
vec2 _TMP249;
vec2 _x0266;
float _triad_size0268;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
float _mask_min_allowed_tile_size;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _dxdy_scale;
    vec2 _dxdy;
    _TMP16 = min(2.00000000E+00, 0.00000000E+00);
    _TMP142 = max(0.00000000E+00, _TMP16);
    _TMP16 = min(1.00000000E+00, 0.00000000E+00);
    _TMP148 = max(0.00000000E+00, _TMP16);
    _TMP16 = min(1.80000000E+01, 3.00000000E+00);
    _TMP154 = max(1.00000000E+00, _TMP16);
    _TMP16 = min(1.92000000E+03, 4.80000000E+02);
    _TMP160 = max(3.42000000E+02, _TMP16);
    _TMP15 = floor(-1.60000000E+01);
    _mask_min_allowed_tile_size = -_TMP15;
    _r0239 = VertexCoord.x*MVPMatrix[0];
    _r0239 = _r0239 + VertexCoord.y*MVPMatrix[1];
    _r0239 = _r0239 + VertexCoord.z*MVPMatrix[2];
    _r0239 = _r0239 + VertexCoord.w*MVPMatrix[3];
    _dxdy_scale = InputSize/OutputSize;
    _dxdy = _dxdy_scale/TextureSize;
    _OUT._bloom_dxdy = vec2(0.00000000E+00, _dxdy.y);
    _estimated_mask_resize_output_dummy_size0241 = OutputSize*vec2( 6.25000000E-02, 6.25000000E-02);
    _TMP242 = true;
    _b0244 = OutputSize.x/_TMP160;
    _TMP17 = _TMP154 + _TMP148*(_b0244 - _TMP154);
    _desired_tile_size_x0241 = 8.00000000E+00*_TMP17;
    if (_TMP142 > 5.00000000E-01) { 
        _TMP240 = vec2(_desired_tile_size_x0241, _desired_tile_size_x0241);
        _TMP242 = false;
    } 
    if (_TMP242) { 
        _temp_tile_size_x0241 = min(_desired_tile_size_x0241, 6.40000000E+01);
        _max_tile_size0241 = _estimated_mask_resize_output_dummy_size0241/2.00000000E+00;
        _TMP24 = min(_max_tile_size0241, vec2(_temp_tile_size_x0241, _temp_tile_size_x0241));
        _TMP249 = max(vec2(_mask_min_allowed_tile_size, _mask_min_allowed_tile_size), _TMP24);
        _TMP19 = min(_TMP249.x, _TMP249.y);
        _TMP20 = min(_TMP249.y, _TMP249.y);
        _reclamped_tile_size0241 = vec2(_TMP19, _TMP20);
        _TMP21 = abs(0.00000000E+00);
        _TMP22 = max(_TMP21, 1.52587891E-05);
        _x0266 = _reclamped_tile_size0241 + vec2(_TMP22, _TMP22);
        _final_resized_tile_size0241 = floor(_x0266);
        _TMP240 = _final_resized_tile_size0241;
    } 
    _triad_size0268 = _TMP240.x/8.00000000E+00;
    _TMP25 = inversesqrt(4.32224991E-03);
    _TMP23 = 1.00000000E+00/_TMP25;
    _OUT._bloom_sigma_runtime = (-5.16799986E-02 + 6.11299992E-01*_triad_size0268) - 1.12199998E+00*_triad_size0268*_TMP23;
    _ret_0._position1 = _r0239;
    _ret_0._tex_uv1 = TexCoord.xy;
    _ret_0._bloom_dxdy = _OUT._bloom_dxdy;
    _ret_0._bloom_sigma_runtime = _OUT._bloom_sigma_runtime;
    gl_Position = _r0239;
    TEX0.xy = TexCoord.xy;
    TEX1.xy = _OUT._bloom_dxdy;
    TEX2.x = _OUT._bloom_sigma_runtime;
    return;
    TEX0.xy = _ret_0._tex_uv1;
    TEX1.xy = _ret_0._bloom_dxdy;
    TEX2.x = _ret_0._bloom_sigma_runtime;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     float _bloom_sigma_runtime1;
COMPAT_VARYING     vec2 _bloom_dxdy;
COMPAT_VARYING     vec2 _tex_uv2;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _tex_uv2;
    vec2 _bloom_dxdy;
    float _bloom_sigma_runtime1;
};
vec4 _TMP28;
uniform sampler2D Texture;
vec3 _TMP249;
float _denom_inv0252;
float _w1_20252;
float _w3_40252;
float _w5_60252;
float _w7_80252;
float _w1_2_ratio0252;
float _w3_4_ratio0252;
float _w5_6_ratio0252;
float _w7_8_ratio0252;
vec3 _sum0252;
float _TMP253;
float _x0254;
float _TMP257;
float _x0258;
float _TMP261;
float _x0262;
float _TMP265;
float _x0266;
float _TMP269;
float _x0270;
float _TMP273;
float _x0274;
float _TMP277;
float _x0278;
float _TMP281;
float _x0282;
float _TMP285;
float _TMP287;
float _x0288;
float _TMP291;
float _b0296;
vec2 _tex_coords0298;
vec2 _tex_coords0304;
vec2 _tex_coords0310;
vec2 _tex_coords0316;
vec2 _tex_coords0328;
vec2 _tex_coords0334;
vec2 _tex_coords0340;
vec2 _tex_coords0346;
vec4 _color0352;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _denom_inv0252 = 5.00000000E-01/(TEX2.x*TEX2.x);
    _x0254 = -_denom_inv0252;
    _TMP253 = pow(2.71828198E+00, _x0254);
    _x0258 = -4.00000000E+00*_denom_inv0252;
    _TMP257 = pow(2.71828198E+00, _x0258);
    _x0262 = -9.00000000E+00*_denom_inv0252;
    _TMP261 = pow(2.71828198E+00, _x0262);
    _x0266 = -1.60000000E+01*_denom_inv0252;
    _TMP265 = pow(2.71828198E+00, _x0266);
    _x0270 = -2.50000000E+01*_denom_inv0252;
    _TMP269 = pow(2.71828198E+00, _x0270);
    _x0274 = -3.60000000E+01*_denom_inv0252;
    _TMP273 = pow(2.71828198E+00, _x0274);
    _x0278 = -4.90000000E+01*_denom_inv0252;
    _TMP277 = pow(2.71828198E+00, _x0278);
    _x0282 = -6.40000000E+01*_denom_inv0252;
    _TMP281 = pow(2.71828198E+00, _x0282);
    _x0288 = 3.48348409E-01/(TEX2.x - 8.60587284E-02);
    _TMP287 = pow(2.71828198E+00, _x0288);
    _TMP291 = pow(2.71828198E+00, _TMP287);
    _b0296 = 3.99334580E-01/TEX2.x;
    _TMP285 = min(_TMP291, _b0296);
    _w1_20252 = _TMP253 + _TMP257;
    _w3_40252 = _TMP261 + _TMP265;
    _w5_60252 = _TMP269 + _TMP273;
    _w7_80252 = _TMP277 + _TMP281;
    _w1_2_ratio0252 = _TMP257/_w1_20252;
    _w3_4_ratio0252 = _TMP265/_w3_40252;
    _w5_6_ratio0252 = _TMP273/_w5_60252;
    _w7_8_ratio0252 = _TMP281/_w7_80252;
    _tex_coords0298 = TEX0.xy - (7.00000000E+00 + _w7_8_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0298);
    _sum0252 = _w7_80252*_TMP28.xyz;
    _tex_coords0304 = TEX0.xy - (5.00000000E+00 + _w5_6_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0304);
    _sum0252 = _sum0252 + _w5_60252*_TMP28.xyz;
    _tex_coords0310 = TEX0.xy - (3.00000000E+00 + _w3_4_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0310);
    _sum0252 = _sum0252 + _w3_40252*_TMP28.xyz;
    _tex_coords0316 = TEX0.xy - (1.00000000E+00 + _w1_2_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0316);
    _sum0252 = _sum0252 + _w1_20252*_TMP28.xyz;
    _TMP28 = COMPAT_TEXTURE(Texture, TEX0.xy);
    _sum0252 = _sum0252 + _TMP28.xyz;
    _tex_coords0328 = TEX0.xy + (1.00000000E+00 + _w1_2_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0328);
    _sum0252 = _sum0252 + _w1_20252*_TMP28.xyz;
    _tex_coords0334 = TEX0.xy + (3.00000000E+00 + _w3_4_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0334);
    _sum0252 = _sum0252 + _w3_40252*_TMP28.xyz;
    _tex_coords0340 = TEX0.xy + (5.00000000E+00 + _w5_6_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0340);
    _sum0252 = _sum0252 + _w5_60252*_TMP28.xyz;
    _tex_coords0346 = TEX0.xy + (7.00000000E+00 + _w7_8_ratio0252)*TEX1.xy;
    _TMP28 = COMPAT_TEXTURE(Texture, _tex_coords0346);
    _sum0252 = _sum0252 + _w7_80252*_TMP28.xyz;
    _TMP249 = _sum0252*_TMP285;
    _color0352 = vec4(_TMP249.x, _TMP249.y, _TMP249.z, 1.00000000E+00);
    FragColor = _color0352;
    return;
} 
#endif
