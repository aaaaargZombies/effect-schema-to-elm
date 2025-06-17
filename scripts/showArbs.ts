import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

const inspect = (a) => {
  pipe(a, JSON.stringify, console.log);

  return a;
};

const show = (a: Schema.Schema.Any) =>
  pipe(
    a,
    Utils.fuzz(5),
    inspect,
    (arbs) => arbs.map(Schema.encodeSync(a)),
    inspect,
    (encoded) => encoded.map(Schema.decodeUnknownSync(a)),
    inspect,
  );

show(
  Data.CustomType(
    "MyNewType",
    {
      _tag: Schema.Literal("one"),
      one: Data.Char,
    },
    {
      _tag: Schema.Literal("two"),
      two: Data.String,
      val: Data.Char,
    },
  ),
);
