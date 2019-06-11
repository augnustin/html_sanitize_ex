defmodule HtmlSanitizeEx.Scrubber do
  def scrub("", _) do
    ""
  end

  def scrub(nil, _) do
    ""
  end

  def scrub(html, scrubber_module) do
    if scrubber_module, do: scrubber_module.before_scrub(html), else: html
    |> HtmlSanitizeEx.Parser.parse()
    |> HtmlSanitizeEx.Traverser.traverse(scrubber_module)
    |> HtmlSanitizeEx.Parser.to_html()
  end
end
