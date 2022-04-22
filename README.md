Readme
======

The source code for my personal Github page available at
<https://jraygauthier.github.io>.


Maintainer
----------

### Entering the reproducible developer environment

Install the [nix] package manager and run `nix-shell` at the root of this
repository.

```bash
$ cd /this/repo/root/dir
$ nix-shell
# ..
```

[nix]: https://nixos.org/download.html#download-nix


### Build and publish a new version of this web site

```bash
$ make html
# ..

# A shortcut to a streamlined build and preview:
$ make html-and-preview
# -> Will open the result in your default browser.
```

Once satisfied, you can publish as follow:

```bash
$ make publish
# ..
```


Todo
----

See separate [todo page](./TODO.md).


License
-------

Everything under `./docs/resume` (i.e: the resume in all provided formats), `./docs/training-certificates`, `./src/template/html/static/img` and `docs/static/img` is
licensed under
[*Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International* license](./LICENSE.CC-BY-NC-ND-4).

Other non code documents (`*.md` and `*.html`) are licensed under
[*Creative Commons Attribution 4.0 International* license](./LICENSE.CC-BY-4).

All accompanying code is licensed under [*Apache 2.0* license](./LICENSE)
