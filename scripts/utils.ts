const module = (name: string) => `module ${name} exposing (..)\n\n`;
const top = (name: string) => `${name} = """`;
const bottom = `    """\n\n`;

type Content = [string, any];

export const printElm = (moduleName: string, expressions: Content[]) => {
  console.log(module(moduleName));
  // log all the expressions...
  expressions.forEach(([name, content]) => {
    console.log(top(name));
    console.log(JSON.stringify(content));
    console.log(bottom);
  });
};
