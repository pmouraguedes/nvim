-- vim.print("loading java modules...")

vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-jdtls" },
})

local java25_cmd = "/usr/lib/jvm/java-25-openjdk/bin/java"
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
if vim.fn.isdirectory(jdtls_path) == 0 then
    vim.notify("JDTLS not found; run :MasonInstall jdtls", vim.log.levels.ERROR)
    return
end

-- Lombok JAR path (bundled with Mason's jdtls)
local lombok_jar = jdtls_path .. "/lombok.jar"
if vim.fn.filereadable(lombok_jar) == 0 then
    vim.notify("Lombok JAR missing; ensure jdtls is fully installed via :Mason", vim.log.levels.WARN)
end

-- Compute root_dir early for reuse
-- local root_dir = require("jdtls").setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
local root_dir = require("jdtls").setup.find_root({ ".git" })
if not root_dir then
    -- vim.notify("No project root found; check for build files", vim.log.levels.ERROR)
    return
end
-- vim.print(root_dir)

-- Find the launcher jar
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
if launcher_jar == "" then
    vim.notify("JDTLS launcher jar not found in " .. jdtls_path .. "/plugins/", vim.log.levels.ERROR)
    return
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
        "-jar", launcher_jar,
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

-- vim.lsp.enable("jdtls")

vim.keymap.set('n', '<A-o>', function() require('jdtls').organize_imports() end, { desc = 'JDTLS: Organize Imports' })
vim.keymap.set('n', 'crv', function() require('jdtls').extract_variable() end, { desc = 'JDTLS: Extract Variable' })
vim.keymap.set('v', 'crv', function() require('jdtls').extract_variable(true) end,
    { desc = 'JDTLS: Extract Variable (Visual)' })
vim.keymap.set('n', 'crc', function() require('jdtls').extract_constant() end, { desc = 'JDTLS: Extract Constant' })
vim.keymap.set('v', 'crc', function() require('jdtls').extract_constant(true) end,
    { desc = 'JDTLS: Extract Constant (Visual)' })
vim.keymap.set('v', 'crm', function() require('jdtls').extract_method(true) end,
    { desc = 'JDTLS: Extract Method (Visual)' })

-- If using nvim-dap (requires java-debug and vscode-java-test bundles)
-- Test class (Normal mode: <leader>df)
vim.keymap.set('n', '<leader>df', function() require('jdtls').test_class() end, { desc = 'JDTLS: Test Class' })
-- Test nearest method (Normal mode: <leader>dn)
vim.keymap.set('n', '<leader>dn', function() require('jdtls').test_nearest_method() end,
    { desc = 'JDTLS: Test Nearest Method' })
