# Effect.Schema to Elm

A proof of concept to generate Elm Types, Decoders and Encoders from Effect Schemas.

Compatible elm types are described in `src/Data.ts` These can be fed into elm-codegen via the `.src/generate.ts`. Passing an object where the keys will become the alias of the type in elm.

I've not taken to approach of converting arbitrary Schema types to Elm types as I think this creates a more predictable outcome and it's easier to do a `Schema.transform` or `Decoder.map` to get to and from your desired data structure than it is to write the glue between the two languages.

Currently this is really just some elm generators and a bunch of glue code piping test data back and forth. More thought needs to go into making it useable with an external project.

## Running locally

- `nix develop --command zsh` if you want don't have all the system deps.
- `pnpm install` to get node dependancies.
- `pnpm run generate` to create the elm code.
- `pnpm run test:all` to test the generated elm decoders against arbitraries created from schemas and then to test elm decoders against the schemas again.

## Deps introduced to project for a user

- `elm-community/json-extra`
- `elmcraft/core-extra`
- `Effect.Schema`
