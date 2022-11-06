local ok, comment = pcall(require, 'Comment')
if not ok then
    print("comment.nvim not found!")
   return
end

comment.setup {}

