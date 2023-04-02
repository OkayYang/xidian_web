class Comment{
    private Comment comments;

    public Comment getComments() {
        return comments;
    }

    public void setComments(Comment comments) {
        this.comments = comments;
    }
}

public class Main {
    public static void main(String[] args) {
        Comment comment = new Comment();
        comment.setComments(new Comment());
    }
}
