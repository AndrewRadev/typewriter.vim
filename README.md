## Demo (sound on)

https://user-images.githubusercontent.com/124255/229273984-9b5ac7f2-11f4-400d-a6dd-e38b12c769ee.mp4

## Usage

To enable typewriter sounds, trigger `:TypewriterEnable`. To stop, use `:TypewriterDisable`. `:TypewriterToggle` will switch on an off and might be useful for a mapping. You can set `g:typewriter_enabled` to `v:true` to start with typewriter mode on.

Going into insert mode will trigger a carriage return, exiting insert mode will ding and typing makes clicking sounds. That's probably not realistic, but it sounds kind of nice.

The clicks are randomized and throttled to a maximum of 6 at a time, since that sounded like the right limit to me. You can adjust `g:typewriter_throttle` or set it to 0 to avoid throttling and get all the clicks at a time you can manage to produce.

## Requirements

You'll need Vim9 with `+sound`. This should be included in the "huge" build by default, so if you don't have it, look for a more inclusive build in your package manager.

Neovim doesn't have `+sound` at the time of writing, but I might accept a PR that spawns an external sound player on neovim.

## References

The [vim-keysound](https://github.com/skywind3000/vim-keysound) plugin by @skywind3000 has a greater variety of sounds, but it requires python and sdl2 to run. It could be a good option for older Vims or Neovim.

There's an existing colorcheme called `typewriter-vim`: https://github.com/logico/typewriter-vim. I'd be open to renaming the project to avoid confusion, but I'd appreciate a good naming suggestion.

The sounds are from freesound.org:

- Ding: <https://freesound.org/people/_stubb/sounds/406243/>
- Clicks: <https://freesound.org/people/tjandrasounds/sounds/201590/>
- Carriage return: <https://freesound.org/people/ramsamba/sounds/318686/>

## Contributing

Pull requests are welcome. Be sure to abide by the [CODE_OF_CONDUCT.md](https://github.com/AndrewRadev/typewriter.vim/blob/master/CODE_OF_CONDUCT.md).
