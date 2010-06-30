class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
#  def index
#    @posts = Post.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @posts }
#    end
#  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @comments = Comment.find_all_by_post_id(params[:id])
    get_author

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    get_author

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    get_author
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    get_author
    @post.author_id = @author.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to([@author,@post], :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    get_author
    (@post.author_id == @author.id) || (@post.author_id = @author.id)

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to([@author,@post], :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(author_posts_url) }
      format.xml  { head :ok }
    end
  end

  private #######################################
  def get_author
    return @author = Author.find(params[:author_id])
  end
end
