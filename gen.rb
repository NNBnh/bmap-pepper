action = {
  back: :todo,
  delete: :todo,
  area: [:todo, :todo],
  exit: "cVs<esc>",

  left: ["k", "ck"],
  right: ["j", "cj"],
  up: ["h", "<c-p>"],
  down: ["l", "<c-n>"],
  backward: ["b", "<c-u>"],
  forward: ["e", "<c-d>"],

  primary: ["i", ":<space>lsp-code-action<enter>"],
  secondary: "s",
  tertiary: ["cv", "V"],
  primary_alt: ["", ":<space>lsp-rename<enter>"],
  secondary_alt: ["cD", "cd"],
  tertiary_alt: ["cs", "cS"],

  time: ["u", "U"],
  cut: ["yd", "d"],
  in: "ycv",
  out: "Y",

  target: ["n", "p"],
  new: ["N", "P"],
  bookmark: ["M", "m"],
  play: ["Q", "q"],

  previous: [:todo, :todo],
  next: [:todo, :todo],
  code: [:todo, :todo],
  terminal: ["!", "|"],

  align_left: "<",
  align_right: ">",
  align_center: :todo,

  command: ":",
  assign: :assign,

  key0: "0",
  key1: "1",
  key2: "2",
  key3: "3",
  key4: "4",
  key5: "5",
  key6: "6",
  key7: "7",
  key8: "8",
  key9: "9",

  focus: [
    {
      "w" => "aw",
      '"' => 'a"',
      "'" => "a'",
      "`" => "a`",
      "|" => "a|",
      "(" => "a(",
      ")" => "a)",
      "[" => "a[",
      "]" => "a]",
      "{" => "a{",
      "}" => "a}",
      "<lt>" => "a<",
      "<gt>" => "a>"
    },
    {
      "w" => "Aw",
      '"' => 'A"',
      "'" => "A'",
      "`" => "A`",
      "|" => "A|",
      "(" => "A(",
      ")" => "A)",
      "[" => "A[",
      "]" => "A]",
      "{" => "A{",
      "}" => "A}",
      "<lt>" => "A<",
      "<gt>" => "A>"
    }
  ],
  self: ["cc", "cC"],
  item: ["cn", "cp"],
  communicated: nil,

  local: :todo,
  movement: [
    {
      "d" => ":<space>lsp-definition<enter>",
      "c" => ":<space>lsp-declaration<enter>",
      "i" => ":<space>lsp-implementation<enter>",
      "r" => ":<space>lsp-references<enter>"
    },
    "gm"
  ],

  advance: {
    ACTION: "zz:<space>lsp-hover<enter>",

    advance: :todo,
    area: "go",
    enter: "gF",

    up: "gk",
    down: "gj",
    left: ["gi", "gh"],
    right: "gl",
    backward: "rp",
    forward: "rn",

    primary: :todo,
    tertiary: "cl",
    primary_alt: :todo,
    secondary_alt: ["cf", "cF"],
    cut: :todo,

    new: "gf",
    code: ":<space>lsp-format<enter>",
    movement: [":<space>lsp-document-symbols<enter>", ":<space>lsp-workspace-symbols<enter>"]
  }
}


qwerty = {
  advance: "<space>",
  back: "<backspace>",
  delete: "<delete>",
  area: "<tab>",
  exit: "<esc>",

  left: "i",
  right: "k",
  up: "j",
  down: "l",
  backward: "u",
  forward: "o",

  primary: "d",
  secondary: "f",
  tertiary: "s",
  primary_alt: "e",
  secondary_alt: "r",
  tertiary_alt: "w",

  time: "z",
  cut: "x",
  in: "c",
  out: "v",

  target: "h",
  new: "n",
  bookmark: "b",
  play: "p",

  previous: [",", "<lt>"],
  next: [".", "<gt>"],
  code: ["/", "?"],
  terminal: ["`", "~"],

  align_left: ["[", "{"],
  align_right: ["]", "}"],
  align_center: ["\\", "|"],

  command: [";", ":"],
  assign: ["'", '"'],

  key0: ["0", "!"],
  key1: ["1", "@"],
  key2: ["2", "#"],
  key3: ["3", "$"],
  key4: ["4", "%"],
  key5: ["5", "^"],
  key6: ["6", "&"],
  key7: ["7", "*"],
  key8: ["8", "("],
  key9: ["9", ")"],

  focus: "a",
  self: "q",
  item: "g",
  communicated: "t",

  local: "y",
  movement: "m"
}
