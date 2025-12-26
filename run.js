var editor = new LoadEditor({
    aot: {
      title: "Text Annotations",
      variants: [
        {
          opt: "ef",
          opt_slider: "entities-features-slider",
          title: "All",
          color: "red",
          html_class: "undefined",
          css_class: "undefined",
          chg_citation: "citation-url",
          hide: {
            hidden: false,
            class: "undefined",
          },
          features: {
            all: true,
            class: "features-1",
          },
        },
        {
          opt: "prs",
          color: "blue",
          title: "Persons",
          html_class: "persons",
          css_class: "pers",
          hide: {
            hidden: false,
            class: "persons .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
        {
          opt: "plc",
          color: "green",
          title: "Places",
          html_class: "places",
          css_class: "plc",
          hide: {
            hidden: false,
            class: "places .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
      ],
      span_element: {
        css_class: "badge-item",
      },
      active_class: "activated",
      rendered_element: {
        label_class: "switch",
        slider_class: "i-slider round",
      },
    },
    ff: {
      name: "Change font family",
      variants: [
        {
          opt: "ff",
          title: "Font Family",
          urlparam: "ff",
          chg_citation: "citation-url",
          fonts: {
            default: "default",
            font1: "Times-New-Roman",
            font2: "Courier-New",
            font3: "Arial-serif",
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: "",
        },
      ],
      active_class: "active",
      html_class: "form-select",
    },
    fs: {
      name: "Create full size mode",
      variants: [
        {
          opt: "fls",
          title: "Full screen on/off",
          urlparam: "fullscreen",
          chg_citation: "citation-url",
          hide: "hide-reading",
          to_hide: "fade",
        },
      ],
      active_class: "active",
      render_class: "nav-link btn btn-round",
      render_svg:
        "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-fullscreen' viewBox='0 0 16 16'><path d='M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z'/></svg>",
    },
    fos: {
      name: "Change font size",
      variants: [
        {
          opt: "fs",
          title: "Font Size",
          urlparam: "fs",
          chg_citation: "citation-url",
          sizes: {
            default: "default",
            font_size_14: "14",
            font_size_18: "18",
            font_size_22: "22",
            font_size_26: "26",
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: "font-size-",
        },
      ],
      active_class: "active",
      html_class: "form-select",
    },
    wr: false,
    up: true,
  });
  
