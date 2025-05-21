import * as CodeGen from "elm-codegen";
import * as ElmData from "./Data.js";

// import * as fs from "fs";
// import * as path from "path";

// const directoryPath = __dirname;
// const directoryPath = "./src";

// const found: { path: string; contents: string }[] = [];

// function readFilesRecursively(dir: string) {
//   const files = fs.readdirSync(dir);
//   for (const file of files) {
//     const filePath = path.join(dir, file);
//     const stat = fs.statSync(filePath);
//     if (stat.isFile()) {
//       const content = fs.readFileSync(filePath, "utf-8");
//       found.push({ path: filePath, contents: content });
//     } else if (stat.isDirectory()) {
//       readFilesRecursively(filePath);
//     }
//   }
// }

// readFilesRecursively(directoryPath);

const dataTypes = [ElmData.Float, ElmData.Char]
  .map((s) => s.ast)
  // turn a class into an object
  .map(JSON.stringify)
  .map(JSON.parse);

CodeGen.run("Generate.elm", {
  debug: true,
  output: "generated",
  // flags: found,
  flags: dataTypes,
  cwd: "./codegen",
});
