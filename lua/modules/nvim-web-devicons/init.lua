require'nvim-web-devicons'.setup {
 -- DevIcon will be appended to `name`
 override = {
  Dockerfile = {
    icon = "",
    color = "#9ba8dc",
    name = "Dockerfile"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
