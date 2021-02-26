version 1.0

task make_panel {
  input {
    String temp
  }

  command {
    make-panel.sh nationalities.txt 23dir
  }
  output {
    File response = "panel.txt.gz"
  }
  runtime {
   docker: "quay.io/testaccountq/test6"
  }
}

workflow make_panel_wdl {
    input {
        String temp = "test"
    }

    call make_panel { input: temp=temp}
}
