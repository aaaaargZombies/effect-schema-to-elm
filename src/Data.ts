import { Schema } from "effect";

const ElmType = Symbol.for("ElmType");

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

type Comparable = typeof Char | typeof String | typeof Int | typeof Float;

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
  Schema.Map({ key: args.key, value: args.value });
export const MapStringInt = Dict({ key: String, value: Int }).pipe(
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

// Record
export const Record = (arg: { [key: string]: Schema.Schema.Any }) =>
  Schema.Struct(arg);

// Result
export const Result = (args: {
  left: Schema.Schema.Any;
  right: Schema.Schema.Any;
}) => Schema.Either(args);

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
export const Type = (name: string, ...kinds: Schema.Schema.Any[]) =>
  Schema.Struct({
    name: Schema.Literal(name),
    kinds: Schema.Tuple(...kinds),
  });

Type("Bert", Float, Int, Unit);

export const Alias = (name: string, type: Schema.Schema.Any) =>
  Schema.Struct({
    name: Schema.Literal(name),
    type: type,
  });

/// Elm platform stuff
// Order
// Platform
// Platform.Cmd
// Platform.Sub
// Process
// Task
