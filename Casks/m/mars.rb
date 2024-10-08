cask "mars" do
  version "4.5,Aug2014"
  sha256 "ac340b676ba2b62246b9df77e62f81ad4447bcfd329ab539716bcd09950b7096"

  url "https://courses.missouristate.edu/KenVollmar/mars/MARS_#{version.csv.first.dots_to_underscores}_#{version.csv.second}/Mars#{version.csv.first.dots_to_underscores}.jar"
  name "MARS"
  desc "Mips Assembly and Runtime Simulator"
  homepage "https://courses.missouristate.edu/KenVollmar/mars/index.htm"

  livecheck do
    url "https://courses.missouristate.edu/KenVollmar/mars/download.htm"
    regex(%r{href=.*?MARS_(\d+(?:_\d+)*)_(\w+\d+)/Mars(?:\d+(?:_\d+)*)\.jar}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0].tr("_", ".")},#{match[1]}" }
    end
  end

  container type: :naked

  artifact "Mars#{version.csv.first.dots_to_underscores}.jar", target: "#{appdir}/Mars.jar"

  caveats do
    depends_on_java "9+"
  end
end
