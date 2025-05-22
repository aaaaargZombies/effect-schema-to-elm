import { describe, expect, it } from "@effect/vitest";
import * as Utils from "../scripts/utils.js";
import * as Data from "../src/Data.js";

describe("Utils", () => {
  it("should pass", () => {
    const names = [Data.Int, Data.Char, Data.String, Data.Maybe(Data.Int)].map(
      (s) => {
        const ast = JSON.parse(JSON.stringify(s.ast));
        return Utils.astToName(ast);
      },
    );
    const expected = ["Int", "Char", "String", "MaybeInt"];
    expect(names).toStrictEqual(expected);
  });
});
