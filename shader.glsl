vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
  vec4 col = Texel(texture, texture_coords);

  if(col.a*color.a == 0)
    return col;
  //if(col.)
  if(col.a > 0.5)
    return vec4(0.2*cos(texture_coords.x*5) + 0.5,0.8, 0.2*cos(texture_coords.y*5)+0.5, col.a);
  else
    return vec4(0, 0, 0, 0);
  /*
  if(col.a > 0.5)
    return vec4(1,0,0,1);
  else
    return col;*/
}
