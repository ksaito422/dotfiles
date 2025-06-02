Reline::Face.config(:default) do |conf|
  conf.define(:default, foreground: "#eef0f9", background: "#17191e")
  conf.define(:enhanced, foreground: "#17191e", background: "#acafff")
  conf.define(:scrollbar, foreground: "#4bf3c8", background: "#17191e")
end

Reline::Face.config(:completion_dialog) do |conf|
  conf.define(:default, foreground: "#eef0f9", background: "#17191e")
  conf.define(:enhanced, foreground: "#17191e", background: "#acafff")
  conf.define(:scrollbar, foreground: "#4bf3c8", background: "#17191e")
end

