local ls = require("luasnip") -- Import LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep -- Import rep for repetition

-- Define Next.js snippets
ls.add_snippets("javascript", {
  -- Snippet for a Next.js page component
  s(
    "nextpage",
    fmt(
      [[
    import Head from 'next/head';

    export default function {}() {{
      return (
        <>
          <Head>
            <title>{}</title>
          </Head>
          <main>
            <h1>{}</h1>
          </main>
        </>
      );
    }}
  ]],
      { i(1, "PageName"), i(2, "Page Title"), i(3, "Main Heading") }
    )
  ),

  -- Snippet for Next.js API route
  s(
    "api",
    fmt(
      [[
    export default function handler(req, res) {{
      if (req.method === '{}') {{
        // Your logic here
        res.status(200).json({{ message: "Success" }});
      }} else {{
        res.setHeader('Allow', ['{}']);
        res.status(405).end(`Method ${'{req.method}'} Not Allowed`);
      }}
    }}
  ]],
      { c(1, { t("GET"), t("POST"), t("PUT"), t("DELETE") }), rep(1) }
    )
  ),

  -- Snippet for Next.js getStaticProps
  s(
    "gsp",
    fmt(
      [[
    export async function getStaticProps() {{
      // Fetch your data here
      return {{
        props: {{ data: {} }},
      }};
    }}
  ]],
      { i(1, "{}") }
    )
  ),

  -- Snippet for Next.js getServerSideProps
  s(
    "gssp",
    fmt(
      [[
    export async function getServerSideProps(context) {{
      // Fetch your data here
      return {{
        props: {{ data: {} }},
      }};
    }}
  ]],
      { i(1, "{}") }
    )
  ),

  -- Snippet for Next.js getStaticPaths
  s(
    "gspaths",
    fmt(
      [[
    export async function getStaticPaths() {{
      // Define paths
      return {{
        paths: [{}],
        fallback: {},
      }};
    }}
  ]],
      { i(1, "[]"), c(2, { t("false"), t("true"), t('"blocking"') }) }
    )
  ),
})

-- Add snippets for TypeScript (if applicable)
ls.add_snippets("typescript", {
  -- Snippet for a Next.js page component (with TypeScript)
  s(
    "nextpage",
    fmt(
      [[
    import Head from 'next/head';
    import {{ NextPage }} from 'next';

    const {}: NextPage = () => {{
      return (
        <>
          <Head>
            <title>{}</title>
          </Head>
          <main>
            <h1>{}</h1>
          </main>
        </>
      );
    }};

    export default {};
  ]],
      { i(1, "PageName"), i(2, "Page Title"), i(3, "Main Heading"), rep(1) }
    )
  ),
})
