import { Schema } from "effect";
import * as Data from "./Data.js";

export const mySchemas = {
  myBool: Data.Bool,
  myChar: Data.Char,
  myFloat: Data.Float,
  myInt: Data.Int,
  myString: Data.String,
  myList: Data.List(Data.String),
  myMaybe: Data.Maybe(Data.Int),
  myResult: Data.Result({ error: Data.String, value: Data.Int }),
  myResult_: Data.Result({
    error: Data.String,
    value: Data.Maybe(Data.List(Data.String)),
  }),
  myRecord: Data.Record({
    one: Data.Char,
    two: Data.String,
  }),
  myRecordLong: Data.Record({
    a: Data.Char,
    b: Data.Char,
    c: Data.Char,
    d: Data.Char,
    e: Data.Char,
    f: Data.Char,
    g: Data.Char,
    h: Data.Char,
    i: Data.Char,
    j: Data.Char,
  }),
  myRecordComplex: Data.Record({
    a: Data.Char,
    b: Data.List(Data.Char),
    c: Data.Maybe(Data.Int),
    d: Data.Char,
    e: Data.Char,
    f: Data.Result({
      error: Data.String,
      value: Data.Result({
        error: Data.String,
        value: Data.Maybe(Data.List(Data.String)),
      }),
    }),
    g: Data.Char,
    h: Data.Char,
    i: Data.Record({
      one: Data.Char,
      two: Data.String,
    }),
    j: Data.Float,
  }),
  myCustomType: Data.CustomType(
    "MyNewType",
    {
      _tag: Schema.Literal("two"),
      one: Data.Char,
    },
    {
      _tag: Schema.Literal("two"),
      two: Data.String,
      val: Data.Char,
    },
  ),
};
