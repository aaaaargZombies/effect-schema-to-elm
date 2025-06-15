# Effect CLI Application Template

This template provides a solid foundation for building scalable and maintainable command-line applications with Effect. 

## Running Code

This template leverages [tsx](https://tsx.is) to allow execution of TypeScript files via NodeJS as if they were written in plain JavaScript.

To execute a file with `tsx`:

```sh
pnpm tsx ./path/to/the/file.ts
```

## Operations

**Building**

To build the package:

```sh
pnpm build
```

**Testing**

To test the package:

```sh
pnpm test
```

## TODO / BUGS

- Comparable TS types to match Elm types, need to have something like `List<Comparable>`

```typescript
type Comparable = typeof Char | typeof String | typeof Int | typeof Float;
```

[view code in context](https://github.com/aaaaargZombies/effect-schema-to-elm/blob/fced363fcc5cca3087accdd7f616a574710adff9/src/Data.ts#L5-L7)

- check nested dict / nested list etc to see if there's shadowing issues with vars
