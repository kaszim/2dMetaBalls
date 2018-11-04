vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
  vec4 col = Texel(texture, texture_coords);
  float t = smoothstep(	0.5, 0.5, col.a);
  vec4 a = mix(color, col, t);

  if(col.a > 0.5)
    if(col.a < 0.6)
      return a;
    else
      return a;
  else
    return col;
}
