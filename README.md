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

### failed test count

```
Passed:   37
Failed:   5
```

stalling out on the string compare method helping because dict from Effect doesn't sort the by key, elm does so the returned encoded values will be in a diff order

```ts
// Decoding examples
console.log(
  decode([
    ["a", "2"],
    ["b", "2"],
    ["c", "3"],
  ]),
);
// Output: { _id: 'HashMap', values: [ [ 'a', 2 ], [ 'c', 3 ], [ 'b', 2 ] ] }
```

[example from effect schema docs](https://effect.website/docs/schema/effect-data-types/#hashmap-1)

really want to be able to test against the actual decoders. need a way to get json out of elm.

### Need to target `Encoded` value of the `Schema`

#### approaches

- set up communication between elm and ts/effect. Bit of a pain! not really sure what the best way to do it its, maybe make a little elm app with ports or something and use Vitest???
  - [Elm program test guides](https://web.archive.org/web/20221225214211/https://elm-program-test.netlify.app/)
  - [Elm program test API docs](https://package.elm-lang.org/packages/avh4/elm-program-test/latest)
- generate testdata like before but using `encodeSync` to produce the correct input / output.
  - might not need to cross the boundary for real if I can test string equality on the Elm side
  - maybe test the encode / decode properties of my elm `Data` schemas too on the TS side

#### details

- Need to use elm to encode/decode to the encoded version of the Effect.Schema. Looks like the big problem here is that I'm only testing the Elm side of things. I need to test that the elm code decodes, then re-encodes it into something Effect understands.

This works 🥳

```ts
const mySchema = Data.Set_(Data.Bool);

const decode = Schema.decodeUnknownSync(mySchema);
const encode = Schema.encodeSync(mySchema);

Utils.fuzz(5)(mySchema).forEach((arb) => console.log(decode(encode(arb))));
```

but this will produce a parsing error 💩

```ts
const mySchema = Data.Set_(Data.Bool);

const decode = Schema.decodeUnknownSync(mySchema);
const encode = Schema.encodeSync(mySchema);

Utils.fuzz(5)(mySchema).forEach((arb) => console.log(decode(encode(arb))));
```

I expected the arbs to produce something you could consume straight away

### Express `Comparable` better

Ideally this would be via a Comparable TS type to match Elm types, need to have something like `List<Comparable>`

Could potentially add a Schema Annotation like I have done with `"Symbol(ElmType)"`

```typescript
type Comparable = typeof Char | typeof String | typeof Int | typeof Float;
```

[view code in context](https://github.com/aaaaargZombies/effect-schema-to-elm/blob/fced363fcc5cca3087accdd7f616a574710adff9/src/Data.ts#L5-L7)
