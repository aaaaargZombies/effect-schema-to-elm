import { JSONSchema, Schema } from "effect";

/// Make some schemes as see how they map to
/// Elm Data types
//
//
/// Basics
// Char
// const Char = Schema.String; // can I just let the elm gen compiler find the fault?
const Char = Schema.String.pipe(
  Schema.filter((s) => s.length === 1 || "A Char is a single character long"),
  Schema.annotations({
    title: "ElmChar",
    jsonSchema: {
      title: "ElmChar",
    },
  }),
);

// TODO Schema.decodeSync(Char)("sss"); // how to ge the type warnings like on duration???

// String
const String = Schema.String;
// Int
const Int = Schema.Int;
// Float
const Float = Schema.Number;

type Comparable = typeof Char | typeof String | typeof Int | typeof Float;

/// Containers
// Array
const Array = (s: Schema.Schema.Any) =>
  Schema.Array(s).pipe(
    Schema.annotations({
      title: "ElmArray",
    }),
  );
// this ends up as a TupleType but the `elements` are empty
// the types of contained values are stored the `rest`
const ArrayInt = Array(Int);
// Dict
const Dict = (args: { key: Comparable; value: Schema.Schema.Any }) =>
  Schema.Map({ key: args.key, value: args.value });
const MapStringInt = Dict({ key: String, value: Int });
// List
const List = (s: Schema.Schema.Any) => Schema.Array(s);
// Maybe
const Maybe = (s: Schema.Schema.Any) => Schema.Option(s);
// Record
const Record = (arg: { [key: string]: Schema.Schema.Any }) =>
  Schema.Struct(arg);
// TODO = can I just let the elm compiler blow up or do I need to add it on this end too.
// const Record = (arg: { [key: string]: Schema.Schema.Any }) =>
//   Schema.Struct(arg).pipe(
//     Schema.filter((struct) =>
//       Object.keys(struct).every(
//         (key) => /^[a-z]/.test(key) || "Entry name not compatible with Elm",
//       ),
//     ),
//   );

// Result
const Result = (args: { left: Schema.Schema.Any; right: Schema.Schema.Any }) =>
  Schema.Either(args);

// Set
const Set_ = (a: Schema.Schema.Any) => Schema.Set(a);

// Tuple
const Tuple2 = (a: Schema.Schema.Any, b: Schema.Schema.Any) =>
  Schema.Tuple(a, b);
const Tuple2vals = Tuple2(String, Int);
const Tuple3 = (
  a: Schema.Schema.Any,
  b: Schema.Schema.Any,
  c: Schema.Schema.Any,
) => Schema.Tuple(a, b, c);
const Tuple3vals = Tuple3(String, Int, String);
// Unit
const Unit = Schema.Tuple();
// this ends up as a TupleType but the `elements` are the types / number of the passed in schemas
// the `rest` is empty because it can't hold an arbitrary amount like an Array

/// Custom types / Type Aliases?

// TODO this needs to be better
// kinds probables needs to be Schema.Struct{ _tag: Schema.string, data: Schama.Tuple/Array()}
const Type = (name: string, ...kinds: Schema.Schema.Any[]) =>
  Schema.Struct({
    name: Schema.Literal(name),
    kinds: Schema.Tuple(...kinds),
  });

Type("Bert", Float, Int, Unit);

const Alias = (name: string, type: Schema.Schema.Any) =>
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

console.log(
  JSON.stringify(
    Object.entries({
      Char,
      String,
      Int,
      Float,
      ArrayInt,
      MapStringInt,
      Tuple2vals,
      Tuple3vals,
      Unit,
      Set: Set_(Float),
      Record: Record({
        x: Float,
        y: Float,
      }),
      Alias: Alias("Name", Record({ x: Float, y: Float })),
      Type: Type(
        "TrafficLight",
        Schema.Struct({
          _tag: Schema.Literal("Green"),
          data: Schema.Tuple(Schema.Boolean),
        }),
        Schema.Struct({
          _tag: Schema.Literal("Amber"),
          data: Schema.Tuple(Schema.Boolean),
        }),
        Schema.Struct({
          _tag: Schema.Literal("Red"),
          data: Schema.Tuple(Schema.Boolean),
        }),
      ),
    }).reduce((acc, [key, val]) => {
      acc[key] = val.ast;
      return acc;
    }, {}),
    null,
    2,
  ),
);
