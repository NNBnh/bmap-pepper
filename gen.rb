actions_table = {
  back: :todo,
  delete: :todo,
  area: [:todo, :todo],
  enter: nil,
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
  primary_alt: [:todo, ":<space>lsp-rename<enter>"],
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
      "a" => "cVgkghcvgjgl",
      "A" => "cVgkghcvgjgl",
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
      "lt" => "a<lt>",
      "gt" => "a<gt>"
    },
    {
      "a" => "cVgkghcvgjgl",
      "A" => "cVgkghcvgjgl",
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
      "lt" => "A<lt>",
      "gt" => "A<gt>"
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
    # TODO: "zz:<space>lsp-hover<enter>",

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
  advance: "space",
  back: "backspace",
  delete: "delete",
  area: "tab",
  enter: "enter",
  exit: "esc",

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
  assign: ["'", '\"'],

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


qwerty.map do |meaning, keys|
  [
    meaning,
    unless keys.is_a? Array
      if keys.match? /\A[[:alpha:]]\z/
        [keys, keys.upcase]
      else
        [keys, "s-" + keys]
      end
    else
      keys
    end
  ]
end
.to_h => layout


actions_table.map do |keys, actions|
  [
    layout[keys],
    ([actions] + [nil, nil]).flatten.first(2)
  ]
  .transpose
end
.flatten(1)
.map do |key, action|
  next [key, action] unless action.is_a? Hash

  action.map do |keys, actions|
    [
      Array(keys.is_a?(Symbol) ? layout[keys] : keys).map { key + "><" + _1 }.first(Array(actions).size),
      Array(actions)
    ]
    .transpose
  end
end
.map { _1[0].is_a?(Array) ? _1 : [[_1]] }.flatten(2)
.map do |key, action|
  action = ":<space>print<enter>" if [:assign, :todo, nil].include? action

  [
    %(map normal "<#{key}>" "#{action}"),
    %(map normal "<a-#{key}>" "#{action}"),
    %(map insert "<a-#{key}>" "<esc>#{action}i")
  ]
  .join("\n")
end
.join("\n").then { puts _1 }
