import { pipe, Schema } from "effect";

const ElmType = Symbol.for("ElmType");

// TODO better type for this
type Comparable = typeof Char | typeof String | typeof Int | typeof Float;
// | typeof List<Comparable>;

// wanted to give these as params to things like Maybe but it seems to break!?
// type ElmType_ =
//   | typeof Char
//   | typeof String
//   | typeof Int
//   | typeof Float
//   | typeof Bool
//   | typeof Array
//   | typeof Dict
//   | typeof List
//   | typeof Record
//   | typeof Result
//   | typeof Set_
//   | typeof Tuple2
//   | typeof Tuple3
//   | MaybeSchema;

// type MaybeSchema = ReturnType<typeof Maybe>;

/// Make some schemes as see how they map to
/// Elm Data types
//
//
/// Basics
// Char
export const Char = Schema.String.pipe(
  Schema.length(1),
  Schema.annotations({
    [ElmType]: "Char",
    title: "ElmChar",
    jsonSchema: {
      title: "ElmChar",
    },
  }),
);

// TODO Schema.decodeSync(Char)("sss"); // how to ge the type warnings like on duration???

// String
export const String = Schema.String.pipe(
  Schema.annotations({
    [ElmType]: "String",
  }),
);

// Int
export const Int = Schema.Int.pipe(
  Schema.annotations({
    [ElmType]: "Int",
  }),
);

// Float
export const Float = Schema.Finite.pipe(
  Schema.annotations({
    [ElmType]: "Float",
  }),
);

// Bool
export const Bool = Schema.Boolean.pipe(
  Schema.annotations({
    [ElmType]: "Bool",
  }),
);

/// Containers
// Array
export const Array = (s: Schema.Schema.Any) =>
  Schema.Array(s).pipe(
    Schema.annotations({
      [ElmType]: "Array",
    }),
  );

// this ends up as a TupleType but the `elements` are empty
// the types of contained values are stored the `rest`
export const ArrayInt = Array(Int);

// Dict
export const Dict = (args: { key: Comparable; value: Schema.Schema.Any }) =>
  Schema.HashMap({ key: args.key, value: args.value }).pipe(
    Schema.annotations({
      [ElmType]: "Dict",
    }),
  );

// List
export const List = (s: Schema.Schema.Any) =>
  Schema.Array(s).pipe(
    Schema.annotations({
      [ElmType]: "List",
    }),
  );

// Maybe
export const Maybe = (s: Schema.Schema.Any) =>
  Schema.Option(s).pipe(
    Schema.annotations({
      [ElmType]: "Maybe",
    }),
  );

// ideall narrow the type on the key
// this type at the moment is kinda meaningless
export const Record = <T extends { [key: string]: Schema.Schema.Any }>(
  arg: T,
) =>
  Schema.Struct(arg).pipe(
    Schema.annotations({
      [ElmType]: "Record",
    }),
  );

// Result
export const Result = (args: {
  error: Schema.Schema.Any;
  value: Schema.Schema.Any;
}) =>
  Schema.Either({ left: args.error, right: args.value }).pipe(
    Schema.annotations({
      [ElmType]: "Result",
    }),
  );

// Set
export const Set_ = (a: Schema.Schema.Any) => Schema.Set(a);

// Tuple
export const Tuple2 = (a: Schema.Schema.Any, b: Schema.Schema.Any) =>
  Schema.Tuple(a, b);
export const Tuple2vals = Tuple2(String, Int);
export const Tuple3 = (
  a: Schema.Schema.Any,
  b: Schema.Schema.Any,
  c: Schema.Schema.Any,
) => Schema.Tuple(a, b, c);
export const Tuple3vals = Tuple3(String, Int, String);

// Unit
export const Unit = Schema.Tuple();
// this ends up as a TupleType but the `elements` are the types / number of the passed in schemas
// the `rest` is empty because it can't hold an arbitrary amount like an Array

/// Custom types / Type Aliases?

// TODO this needs to be better
// kinds probables needs to be Schema.Struct{ _tag: Schema.string, data: Schama.Tuple/Array()}
// I want it to be a union of structs where all the inner types have a `_tag` field

type CustomTypeVariantArg = {
  _tag: Schema.Literal<[string]>;
  [key: string]: Schema.Schema.Any;
};

// TODO is this a good API for folks making a custom type?
// how ill I decode it?
export const CustomType = (
  name: string,
  kind: CustomTypeVariantArg,
  ...kinds: CustomTypeVariantArg[]
) => {
  const variants = [kind, ...kinds]
    .map((k) => ({
      _id: Schema.Literal(name),
      ...k,
    }))
    .map((k) => Schema.Struct(k));

  return Schema.Union(...variants).pipe(
    Schema.annotations({
      [ElmType]: "CustomType",
    }),
  );
};

// Type("Bert", Float, Int, Unit);

// Everything becomes an alias on ingesting via flags
// export const Alias = (name: string, type: Schema.Schema.Any) =>
//   Schema.Struct({
//     name: Schema.Literal(name),
//     type: type,
//   });

/// Elm platform stuff
// Order
// Platform
// Platform.Cmd
// Platform.Sub
// Process
// Task

// pipe(
//   Result({
//     error: String,
//     value: Int,
//   }).ast,
//   JSON.stringify,
//   console.log,
// );
