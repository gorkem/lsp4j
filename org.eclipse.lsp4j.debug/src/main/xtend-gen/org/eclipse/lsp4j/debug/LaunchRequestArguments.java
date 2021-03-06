/**
 * Copyright (c) 2017 Kichwa Coders Ltd. and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 */
package org.eclipse.lsp4j.debug;

import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder;

/**
 * Arguments for 'launch' request.
 */
@SuppressWarnings("all")
public class LaunchRequestArguments {
  /**
   * If noDebug is true the launch request should launch the program without enabling debugging.
   * <p>
   * This is an optional property.
   */
  private Boolean noDebug;
  
  /**
   * If noDebug is true the launch request should launch the program without enabling debugging.
   * <p>
   * This is an optional property.
   */
  @Pure
  public Boolean getNoDebug() {
    return this.noDebug;
  }
  
  /**
   * If noDebug is true the launch request should launch the program without enabling debugging.
   * <p>
   * This is an optional property.
   */
  public void setNoDebug(final Boolean noDebug) {
    this.noDebug = noDebug;
  }
  
  @Override
  @Pure
  public String toString() {
    ToStringBuilder b = new ToStringBuilder(this);
    b.add("noDebug", this.noDebug);
    return b.toString();
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    LaunchRequestArguments other = (LaunchRequestArguments) obj;
    if (this.noDebug == null) {
      if (other.noDebug != null)
        return false;
    } else if (!this.noDebug.equals(other.noDebug))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.noDebug== null) ? 0 : this.noDebug.hashCode());
    return result;
  }
}
