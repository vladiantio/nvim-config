local present, Comment = pcall(require, 'Comment')

if not present then
  return
end

Comment.setup()
