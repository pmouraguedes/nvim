vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local java25_cmd = "/usr/lib/jvm/java-25-openjdk/bin/java"
local jdtls_path = vim.fn.expand("$MASON/packages/jdtls") -- Fixed for Mason 2.0
if vim.fn.isdirectory(jdtls_path) == 0 then
    vim.notify("JDTLS not found; run :MasonInstall jdtls", vim.log.levels.ERROR)
    return
end

-- Lombok JAR path (bundled with Mason's jdtls)
local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
if vim.fn.filereadable(lombok_jar) == 0 then
    vim.notify("Lombok JAR missing; ensure jdtls is fully installed via :Mason", vim.log.levels.WARN)
end

vim.lsp.config("jdtls", {
    cmd = {
        java25_cmd,                  -- Run JDT LS with JDK 25
        "-javaagent:" .. lombok_jar, -- Lombok agent: Enables @Slf4j, @Getter, etc.
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL", -- Set to WARN/OFF for less noise
        "-Xmx4g",          -- Bump if large project
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", jdtls_path .. "/config_linux", -- Or config_mac/config_win
        "-data", vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
    },

    settings = {
        java = {
            runtimes = {
                {
                    name = "JavaSE-1.8",
                    path = "/usr/lib/jvm/java-8-openjdk-amd64",
                },
                {
                    name = "JavaSE-17",
                    path = "/usr/lib/jvm/java-17-openjdk ",
                },
            },
            project = {
                sourcePaths = {
                    "target/generated-sources/annotations",   -- MapStruct
                    "target/generated-sources/protobuf/java", -- Protobuf
                },
            },
            import = {
                maven = {
                    enabled = true, -- Enable Maven import
                },
                eclipse = {
                    enabled = false, -- Disable Eclipse project import
                },
            },
            format = {
                enabled = true,
                settings = {
                    url =
                    "file:///home/pguedes/dev/acoss/rp-vertical-pos-app-adapter-local/aldisued/warp/development/eclipse-preferences/dev/java-codestyle.xml",
                    profile = "GEBIT",
                },
            },
            eclipse = {
                preferences = {
                    ["org.eclipse.jdt.ui.importorder"] = "java;javax;org;com;de.gebit.trend;de.gebit.pos",
                },
            },
        },
    },
})

vim.lsp.enable("jdtls")
