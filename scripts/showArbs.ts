import { pipe, Schema } from "effect";
import * as Data from "../src/Data.js";
import * as Utils from "./utils.js";

const show = (a: Schema.Schema.Any) =>
  pipe(
    a,
    Utils.fuzz(5),
    (arbs) => arbs.map(Schema.encodeSync(a)),
    JSON.stringify,
    console.log,
  );

show(Data.Dict({ key: Data.String, value: Data.Int }));
