local keyset = vim.keymap.set

-- escape key
keyset("i", "jj", "<esc>")
keyset("i", "jk", "<esc>")
keyset("i", "kj", "<esc>")
keyset("c", "jj", "<c-c>")
keyset("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode." })

-- quick command mode
keyset({ "n", "v" }, ";", ":", { desc = "Enter command-line mode" })
keyset("n", "<localleader>l", ":nohl<cr>", { desc = "Quickly clear the highlighting" })

-- quick undo and redo in insert mode
keyset("i", "<c-r>", "<c-o><c-r>")

-- saving with ctrl-s
keyset("n", "<c-s>", ":w<cr>", { desc = ":w" })
keyset("i", "<c-s>", "<c-o>:w<cr>", { desc = ":w" })

-- delete everything in file
keyset("n", "X", ":%d_<cr>", { desc = "Delete everything in the current buffer" })
keyset({ "n", "i" }, "<c-a>", ":%y<cr>", { desc = "Yank the whole file" })

-- alt + motion to move line up and down
keyset("n", "<m-j>", ":m+<cr>==", { desc = "Move the current line up" })
keyset("n", "<m-k>", ":m-2<cr>==", { desc = "Move the current line down" })
keyset("v", "J", ":m'>+1<cr>gv=gv", { desc = "Move select block up" })
keyset("v", "K", ":m'<-2<cr>gv=gv", { desc = "Move selected block down" })

keyset(
  "n", "<localleader>bb", ":%bd|e#|bd#",
  { desc = "Delete all buffers except the current one." }
)
