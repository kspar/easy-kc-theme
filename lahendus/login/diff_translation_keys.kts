import java.io.File


val baseFilename = "TODO" // e.g. "/home/kaspar/IdeaProjects/easy-kc-theme/base/login/messages/messages_en.properties"
val customFilename = "TODO" // e.g. "/home/kaspar/IdeaProjects/easy-kc-theme/lahendus/login/messages/messages_et.properties"


val baseKeys: Map<String, String> = keysFromLines(File(baseFilename).readLines())
val customKeys: Map<String, String> = keysFromLines(File(customFilename).readLines())

val keysInBoth = baseKeys.filter { customKeys.containsKey(it.key) }
val keysOnlyInBase = baseKeys.filter { !customKeys.containsKey(it.key) }
val keysOnlyInCustom = customKeys.filter { !baseKeys.containsKey(it.key) }

println("Number of keys in base file: ${baseKeys.size}")
println("Number of keys in custom file: ${customKeys.size}")
println("Number of matching keys (found in both files): ${keysInBoth.size}")

println()
println("New keys - base keys not found in custom file (${keysOnlyInBase.size}):")
println("-----------------------------------------------------")
keysOnlyInBase.values.forEach { println(it) }

println()
println("Useless keys - custom keys not found in base file (${keysOnlyInCustom.size}):")
println("-----------------------------------------------------")
keysOnlyInCustom.values.forEach { println(it) }



fun keysFromLines(lines: List<String>) = lines.filter {
    it.contains("=")
}.map {
    it.split("=")[0].trim() to it
}.toMap()
