; extends

("text" @comment.todo
  (#any-of? @comment.todo "TODO" "WIP")
  (#set! "priority" 126))

("text" @comment.note
  (#any-of? @comment.note "NOTE")
  (#set! "priority" 126))

("text" @comment.warning
  (#any-of? @comment.warning "WARN" "WARNING")
  (#set! "priority" 126))

("text" @comment.error
  (#any-of? @comment.error "ERROR" "BUG" "FIXME")
  (#set! "priority" 126))
